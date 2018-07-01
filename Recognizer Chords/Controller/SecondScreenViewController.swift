//
//  SecondScreenViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 4/16/18.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit
import AVFoundation
import CoreData

/* Abstract:
La segunda pantalla de la aplicación. Contiene cuatro botones representando un los acordes mayor, menor, disminuído y aumentando más un botón de play.
*/

class SecondScreenViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	/// User Interface ................................................
	// indica si el botón ya fue tapeado
	var buttonWasTapped = true
	
	// los botones de acordes fueron tapeados
	var majorButtonWasTapped = true
	var minorButtonWasTapped = true
	var diminishedButtonWasTapped = true
	var augmentedButtonWasTapped = true
	
	// score bar bottom
	let pointsBarView = PointsView()
	let errorsBarView = ErrorsView()
	
	// esconde la barra de estado
	override var prefersStatusBarHidden: Bool { return true }
	
	/// Audio .........................................................
	// reproductor de audio
	var audioPlayer: AVAudioPlayer?

	
	/// Core Data/ .....................................................
	
	// el score actual es 8 ya que es el requisito para estar en la 2da pantalla
	var actualScore: Int = 8
	
	var dataController: DataController! // inyecta el controlador de datos (core data stack)
	
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

	// los cinco botones que contiene esta pantalla
	@IBOutlet weak var majorButton: UIButton!
	@IBOutlet weak var minorButton: UIButton!
	@IBOutlet weak var playButton: UIButton!
	@IBOutlet weak var diminishedButton: UIButton!
	@IBOutlet weak var augmentedButton: UIButton!
	
	// indicator de actividad (networking)
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	/// task: cargar la supervista..
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
	}
	
	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
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
			
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
			// agrega un punto a la variable 'scoreToAdd'
			scoreToAdd += 1
			
		} else {
			// caso contrario...
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
		}
		
		// el juego progresa o finaliza de acuerdo al desempeño del usuar
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
		if minorButtonWasTapped {
			disableButtons(all: false)
		}
		
		/// 2- Logic ....................................................
		
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
		
		// el juego progresa o finaliza de acuerdo al desempeño del usuario
		progressOrGameOver()
		
		/// 3- Networking 🚀 ...........................................
		
		internetRecheability()
		requestChordDataAudio()
	}
	
	/// task: ejectutarse cada vez que el botón 'disminuído' es tapeado
	@IBAction func diminishedButtonPressed(_ sender: UIButton) {
		
		/// 1- User Interface ...........................................
		// una vez tapeado el botón de disminuído, todos los botones de acordes se deshabilitan
		if diminishedButtonWasTapped {
			disableButtons(all: false)
		}
		
		/// 2- Logic ....................................................
		// si sonó un acorde disminuído y el usuario tapeó el botón de disminuído, ACIERTO!
		if FirebaseClient.aChordSounded == FirebaseClient.TypesOfChords.Diminished {
			
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
			// agrega un punto a la variable 'scoreToAdd'
			scoreToAdd += 1
			
		} else {
			
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
		}
		
		// el juego progresa o finaliza de acuerdo al desempeño del usuario
		progressOrGameOver()
		
		/// 3- Networking 🚀 ...........................................
		
		requestChordDataAudio()
		internetRecheability()
	}
	
	/// task: ejectutarse cada vez que el botón 'aumentado' es tapeado
	@IBAction func augmentedButtonPressed(_ sender: UIButton) {
		
		/// 1- User Interface ...........................................
		
		// una vez tapeado el botón de mayor, todos los botones de acordes se deshabilitan
		if augmentedButtonWasTapped {
			disableButtons(all: false)
		}
		
		/// 2- Logic ....................................................
		
		// si sonó un acorde aumentado y el usuario tapeó el botón de aumentado, ACIERTO!...
		if FirebaseClient.aChordSounded == FirebaseClient.TypesOfChords.Augmented {
			
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
			// agrega un punto a la variable 'scoreToAdd'
			scoreToAdd += 1
			
		} else {
	
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
		}
		
		// el juego progresa o finaliza de acuerdo al desempeño del usuario
		progressOrGameOver()
		
		/// 3- Networking 🚀 ...........................................
		
		requestChordDataAudio()
		internetRecheability()
	}
	
	
	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		/// 1- User Interface ..........................................
		// habilita los botones de acordes
		majorButton.isEnabled = true
		minorButton.isEnabled = true
		diminishedButton.isEnabled = true
		augmentedButton.isEnabled = true
		
		/// 2- Audio ....................................................
		
		// a-toma los ÚLTIMOS datos de audio almacenados en memoria, ahora puestos en el reproductor
		do {
			audioPlayer = try AVAudioPlayer(data: FirebaseClient.dataChord)
			audioPlayer?.prepareToPlay()
			
		} catch let error as NSError {
			
			print(error.debugDescription)
		}

		// b-y los reproduce
		audioPlayer?.play()
	}

	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: computar los aciertos y errores del usuario en su sesión y actuar en consecuencia
	func progressOrGameOver() {
		
		/// PROGRESS...
		// si el usuario acertó ocho veces en su sesión sube de nivel y pasa a la siguiente pantalla
		if pointsBarView.currentValue == 1 { // luego cambiar a 8
			
			// se deshabilitan todos los botones
			disableButtons(all: true)
			
			// espera 5 segundos antes de navegar hacia la siguiente pantalla...
			Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: {(timer) in
				
				// y navega hacia la próxima pantalla
				self.performSegue(withIdentifier: "next screen", sender: nil)
			})

		} // end if
		
		/// GAME OVER.
		// si el usuario erró 3 veces en su sesión, pierde
		if errorsBarView.currentValue == 3 {
			
			// se anula la UI
			disableButtons(all: true)
			playButton.isHidden = true
			activityIndicator.isHidden = true
			
			// a-ENTONCES GRABA-PERSISTE el score del usuario 💿

			//addScoreToCoreData(hit: self.scoreToAdd)
			
			// b-espera 4 segundos antes de navegar hacia la siguiente pantalla
			Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false, block: {(timer) in
				self.performSegue(withIdentifier: "to game over", sender: nil)
			}
		)}
	}
	
	//*****************************************************************
	// MARK: - Core Data (creates and save Score)
	//*****************************************************************
	
	/// task: recibir el score actual y agregarlo a core data
	func addScoreToCoreData(hit: Double) {
		
		// Core Data CREATES and SAVE score
		
		// crea un objeto gestionado 'score' para almacenar el score actual
		let score = Score(hits: hit, context: dataController.viewContext)
		
		// agrega el score (managed object) a un array que contiene los scores persistidos '[Score]'
		scores.append(score)
		
		// intenta guardar los cambios que registra el contexto (en este caso, que se agregó un nuevo objeto ´Score´)
		try? dataController.viewContext.save() // 💿
	}

} // end class





