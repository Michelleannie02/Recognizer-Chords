//
//  FirstScreenViewController
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 21/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit
import AVFoundation
import CoreData

/* Abstract:
La primer pantalla de la aplicación. Contiene dos botones representando un acorde mayor y un acorde menor más un botón de play.
*/

class FirstScreenViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************

	/// User Interface ................................................
	// los botones de acordes fueron tapeados
	var majorButtonWasTapped = true
	var minorButtonWasTapped = true
	
	// indica si el botón ya fue tapeado
	var buttonWasTapped = true
	
	// bar score bottom
	let pointsBarView = PointsView()
	let errorsBarView = ErrorsView()
	
	// esconde la barra de estado
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
	/// Audio .........................................................
	// reproductor de audio
	var audioPlayer: AVAudioPlayer?
	
	/// Core Data .....................................................
	// inyecta el controlador de datos (core data stack)
	var dataController: DataController!
	
	// un array que contiene los objetos 'Score' persistidos
	var scores: [Score] = []
	
	// se encarga de contabilizar el score actual del usuario
	var scoreToAdd: Double = 0
	
	/// Internet Recheability ..........................................
	let connection = ConnectionPossibilities(connection: .none)
	let recheability = Reachability()!
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************

	// los triángulos de la barra de menú
	@IBOutlet weak var chordsInfoButton: UIButton!
	@IBOutlet weak var lastScoresButton: UIButton!
	
	// los tres botones que contiene esta pantalla
	@IBOutlet weak var majorButton: UIButton!
	@IBOutlet weak var minorButton: UIButton!
	@IBOutlet weak var playButton: UIButton!
	
	// indicator de actividad (networking)
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	/// task: cargar la supervista
    override func viewDidLoad() {
        super.viewDidLoad()

		/// User Interface ............................................
		// prepara el estado de los elementos gráficos de la interfaz
		setUserInterface()
		
		/// Autolayout ................................................
		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		autolayout()
		
		/// Networking - request data audio chord 🚀 ..................
		requestChordDataAudio()
		
		/// Internet Recheability .....................................
		internetRecheability()
		
		/// Core Data .................................................
		fetchRequestForScores()
	}
	
	/// task:
	override func viewWillAppear(_ animated: Bool) {
		restartScreen()
	}
	
	//*****************************************************************
	// MARK: - Core Data (fetch request)
	//*****************************************************************
	
	/// task: buscar si hay objetos 'Score' persistidos
	func fetchRequestForScores() {
		
		// hay objetos 'Pin' persistidos?
		let fetchRequest: NSFetchRequest<Score> = Score.fetchRequest() // 🔍
		
		// comprueba si hay resultados en la búsqueda..
		if let result = try? dataController.viewContext.fetch(fetchRequest) {
			
			// .. si es así, asigna el resultado de la solicitud al array de scores persistidos
			scores = result // pins:[Score] 🔌
			debugPrint("tus scores persistidos son: \(scores.count)")
		}
		
		// scores guardados debug
		for score in scores {
			debugPrint("Tus scores son: \(scores.index(of: score)!)->\(Int(score.hits))")
		}
	}
	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	// Major, Minor & Play Buttons

	/// task: ejectutarse cada vez que el botón 'major' es tapeado
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		/// 1- User Interface .........................................
		
		// una vez tapeado el botón de mayor, todos los botones de acordes se deshabilitan
		if majorButtonWasTapped {
			disableButtons(all: false)
		}

		/// 2- Logic ...................................................
		
		// si sonó un acorde mayor y el usuario tapeó el botón de mayor, ACIERTO!...
		if FirebaseClient.aChordSounded == FirebaseClient.TypesOfChords.Major {
			
			// da un paso en la barra de aciertos
			pointsBarView.currentValue += 1
			
			// agrega un punto a la variable 'scoreToAdd'
			scoreToAdd += 1
			
		} else {
			// caso contrario...
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
		}
		
		// el juego progresa o finaliza de acuerdo a los aciertos u errores del usuario
		progressOrGameOver()
		
		/// 3- Networking 🚀 ...........................................
		
		// antes de realizar la solicitud comprobar si hay conexión a internet
		internetRecheability()
		
		// por último, realizar una solicitud web
		requestChordDataAudio()
	}
	
	/// task: ejectutarse cada vez que el botón 'minor' es tapeado
	@IBAction func minorButtonPressed(_ sender: UIButton) {

		/// 1- User Interface ...........................................
		
		// una vez tapeado el botón de menor, todos los botones de acordes se deshabilitan
		if minorButtonWasTapped {
			disableButtons(all: false)

		}

		/// 2- Logic .....................................................
		
		// si sonó un acorde menor y el usuario tapeó el botón de menor, ACIERTO!...
		if FirebaseClient.aChordSounded == FirebaseClient.TypesOfChords.Minor {
			
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
			// agrega un punto a la variable 'scoreToAdd'
			scoreToAdd += 1
			
		} else {
			// caso contrario...
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
			
		}
		
		// // el juego progresa o finaliza de acuerdo a los aciertos u errores del usuario
		progressOrGameOver()

		/// 3- Networking 🚀 ..................................................
		
		//internetRecheability()
		internetRecheability()
		requestChordDataAudio()
	}
	
	
	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		/// 1- User Interface .................................................
		
		majorButton.isEnabled = true
		minorButton.isEnabled = true
		
		/// 2- Audio ..........................................................
		
		// a- toma los ÚLTIMOS datos de audio almacenados en memoria, ahora puestos en el reproductor
		do {
			audioPlayer = try AVAudioPlayer(data: FirebaseClient.dataChord)
			audioPlayer?.prepareToPlay()
			
		} catch let error as NSError {
			
			print(error.debugDescription)
		}
		
		// b- y los reproduce
		audioPlayer?.play()
	}

	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: computar los aciertos y errores del usuario en su sesión y actuar en consecuencia
	func progressOrGameOver() {
		
		/// PROGRESS...
		// si el usuario acertó ocho veces en su sesión sube de nivel y pasa a la siguiente pantalla
		if pointsBarView.currentValue == 8 {
			
			// se deshabilitan todos los botones
			activityIndicator.isHidden = true
			disableButtons(all: true)
			
			// espera 4 segundos antes de navegar hacia la siguiente pantalla...
			Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false, block: {(timer) in

				// y navega hacia la próxima pantalla
				self.performSegue(withIdentifier: "next screen", sender: nil)
			})

		} // end if

		
		/// GAME OVER.
		// si el usuario erró 3 veces en su sesión, pierde
		if errorsBarView.currentValue == 3 {
			
			// se anula la UI
			activityIndicator.isHidden = true
			disableButtons(all: true)
			playButton.isHidden = true
			
			// a-entonces agrega el score del usuario a core data
			addScoreToCoreData(hits: self.scoreToAdd)
			
			// b-espera 4 segundos antes de navegar hacia la siguiente pantalla
			Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false, block: {(timer) in
				self.performSegue(withIdentifier: "to game over", sender: nil)
			}
		)}
	}
	
	//*****************************************************************
	// MARK: - Core Data (creates and save Score)
	//*****************************************************************
	
	/// task: recibir el score actual y agregarlo a la propiedad 'hits' del objeto gestionado 'Score'
	func addScoreToCoreData(hits: Double) {
		
		// Core Data CREATES and SAVE score
		
		// CREA un objeto gestionado 'score' para almacenar el score actual
		let score = Score(hits: hits, context: dataController.viewContext)

		// agrega el score a un array que contiene los scores '[Score]'
		scores.append(score)
		
		debugPrint("tu último score guardado es de: \(Int(score.hits))")
		
		// y por último GUARDA los cambios que registra el contexto (en este caso, que se agregó un nuevo objeto ´Score.hits´)
		try? dataController.viewContext.save() // 💿
	}
	
} // end class


extension FirstScreenViewController {
	
	// task: inyectar a 'ScoresViewController' y a 'SecondScreenViewController' el 'data controller'
	override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
		
		if segue.identifier == "three last scores" {
			
			// el destino de la transición, el 'ScoresViewController'
			let scoresVC = segue.destination as! ScoresViewController
			
			// el controlador de datos
			scoresVC.dataController = dataController

		}
		
		if segue.identifier == "next screen" {
			let secondScreenVC = segue.destination as! SecondScreenViewController
			secondScreenVC.dataController = dataController
		}
	}
}




	
	
	
	

	




