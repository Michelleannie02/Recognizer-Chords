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

/* Abstract:
La primer pantalla de la aplicación. Contiene dos botones representando un acorde mayor y un acorde menor más un botón de play.
*/

class FirstScreenViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// UI ELEMENTOS
	// información desplegada del menú
	let chordsInfo = ChordsInfo()
	
	// la barra que me traje
	let pointsBarView = PointsView()
	let errorsBarView = ErrorsView()

	// una variable que contiene la cantidad de veces que fue presionado el botón 'play'
	var counter = Counter()
	
	// lenguaje actual
	var englishLanguage = true
	
	// los botones de acordes fueron tapeados
	var majorButtonWasTapped = true
	var minorButtonWasTapped = true
	
	// indica si el botón ya fue tapeado
	var buttonWasTapped = true
	
	// scores
	var actualScore: Int = 0
	
	// los tipos de botones disponibles
	// cada valor (tag) se corresponde con un tipo de botón diferente
	enum chordButtonType: Int {
		case major = 0, minor
	}
	
	// AUDIO ///////////////////////////////////////////////////////
	// reproductor de audio
	var audioPlayer: AVAudioPlayer?
	// los datos el acorde elegido
	
	let firebase = FirebaseClient()
//	var dataChord = FirebaseClient.dataChord

	
	// PERSISTENCIA ///////////////////////////////////////////////
	// TODO: core data!
	var savedScores: [Int] = []
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************

	// los íconos de la barra de menú
	@IBOutlet weak var chordsInfoButton: UIButton!
	@IBOutlet weak var lastScoresButton: UIButton!
	@IBOutlet weak var languageButton: UIButton!
	
	// los tres botones que contiene esta pantalla
	@IBOutlet weak var majorButton: UIButton!
	@IBOutlet weak var playButton: UIButton!
	@IBOutlet weak var minorButton: UIButton!
	
	// indicator de actividad (networking)
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	// task: cargar la supervista..
    override func viewDidLoad() { // 🚪
        super.viewDidLoad()
		
		// en principio los botones de mayor y menor se encuentran deshabilitados
		majorButton.isEnabled = false
		minorButton.isEnabled = false
		
		// las contenedores con información acerca de acordes y puntaje también
		chordsInfo.isHidden = true
		
		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		autolayout()
	
		// prepara el primer acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		firebase.setupChord(firstScreen: self, secondScreen: nil)
		
    }

	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	// Menu Bar Buttons
	/// task: ejectutarse cada vez que el botón 'chords info' es tapeado
	@IBAction func chordsInfoButtonPressed(_ sender: UIButton) {
		
		print("🤼‍♀️ El boton fue presionado está en \(buttonWasTapped)")
		
		// el área aparece
		if buttonWasTapped {
			chordsInfo.isHidden = false
			buttonWasTapped = false
			
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			playButton.isEnabled = false
			
			// el área desaparece
		} else {
			chordsInfo.isHidden = true
			buttonWasTapped = true
			
			majorButton.isEnabled = true
			minorButton.isEnabled = true
			playButton.isEnabled = true
		}
		
	}
	
	/// task: ejectutarse cada vez que el botón 'last scores' es tapeado
	@IBAction func lastScoresButtonPressed(_ sender: UIButton) {
		
		print("🤼‍♀️ El boton fue presionado está en \(buttonWasTapped)")
		
		// el área aparece
		if buttonWasTapped {
			chordsInfo.isHidden = false
			buttonWasTapped = false
			
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			playButton.isEnabled = false
			
		// el área desaparece
		} else {
			chordsInfo.isHidden = true
			buttonWasTapped = true
			
			majorButton.isEnabled = true
			minorButton.isEnabled = true
			playButton.isEnabled = true
		}
		

		
	}
	
	/// task: ejectutarse cada vez que el botón 'language' es tapeado
	@IBAction func languageButtonPressed(_ sender: UIButton) {
		
		// si el lenguaje actual está en inglés, cambiar a español
		if englishLanguage {
		languageButton.setTitle("ES", for: .normal)
		englishLanguage = false
		print("ahora la app está en español")
		// si está en español, cambiar a inglés
		} else {
		languageButton.setTitle("EN", for: .normal)
		print("ahora la app está en inglés")
		englishLanguage = true
		}
		
		// prueba
		pointsBarView.currentValue += 1
		print("👏tu puntaje actual es de \(pointsBarView.currentValue)")
		
		
		
		if pointsBarView.currentValue == 8 {
			
			//
		}
		
		// va contando los aciertos
		actualScore = Int(pointsBarView.currentValue)
		print("tu score actual es \(actualScore)")
		
		savedScores.append(actualScore)
		print("🔌\(savedScores)")
	
		
	}
	
	
	// Major, Minor & Play Buttons
	
	/// task: ejectutarse cada vez que el botón 'major' es tapeado
	@IBAction func majorButtonPressed(_ sender: UIButton) {

		// test
		print("el botón de mayor fue presionado")

		// cuando el usuario tapea el botón mayor, el botón play vuelva a aparecer
		playButton.isHidden = false


		if majorButtonWasTapped {
			majorButton.isEnabled = false
			minorButton.isEnabled = false

		}

		// el contador del botón play se pone a 0
		counter.playButtonValue = 0

		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		firebase.setupChord(firstScreen: self, secondScreen: nil)

	}


	/// task: ejectutarse cada vez que el botón 'minor' es tapeado
	@IBAction func minorButtonPressed(_ sender: UIButton) {

		print("el botón de menor fue presionado")


		playButton.isHidden = false

		if minorButtonWasTapped {
			minorButton.isEnabled = false
			majorButton.isEnabled = false

		}
		
		
		// si sonó un acorde menor y el usuario tapeó el botón de menor, ACIERTO!
		if FirebaseClient.aChordSounded == "minor" {
			
			print("ACERTASTE!!!! SONó UN ACORDE MENOR!!!!!!!!")
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
	
		} else {
			
			print("YERRASTE!!!!!!!!")
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
			
		}
		
		// si el usuario erró más de tres veces en su sesión, pierde
		if errorsBarView.currentValue == 3 {
			
			performSegue(withIdentifier: "ir a game over", sender: nil)
			
			
		}
		
		
		// el contador del botón play se pone a 0
		counter.playButtonValue = 0

		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		firebase.setupChord(firstScreen: self, secondScreen: nil)
		
		
	}



	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		majorButton.isEnabled = true
		minorButton.isEnabled = true

		
		// Contador ///////////////////////////////////////////////
		
		// cada vez que se tapea el botón de play se incrementa en 1 el contador
		counter.incrementPlayButton()
		print("✏️\(counter.playButtonValue)")

		if counter.playButtonValue == 3 {
			
			// UI
			counter.playButtonValue = 0
			playButton.isHidden = true
			majorButton.isEnabled = true
			minorButton.isEnabled = true
		}
		
		
		// Audio //////////////////////////////////////////////////
		
		// 1-prepara el acorde a sonar...

		// un acorde mayor o uno menor
//		firebase.setupChord(firstScreen: self, secondScreen: nil)
		
		
		// 2-lo pone el el reproductor
		do {
			audioPlayer = try AVAudioPlayer(data: FirebaseClient.dataChord)
			audioPlayer?.prepareToPlay()
			
		} catch let error as NSError {
			
			print(error.debugDescription)
		}
		
		
		// 3-y lo reproduce
		audioPlayer?.play()


	}

	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
	
	/// esconde la barra de estado
	override var prefersStatusBarHidden: Bool {
			return true
		}
	
	/**
	Muestra al usuario un mensaje acerca de porqué el sonido no suena.
	
	- Parameter title: El título del error.
	- Parameter message: El mensaje acerca del error.
	
	*/
	func displayErrorAlert(_ title: String?, _ message: String?) {
		
		// Reset UI
		setUIEnabled(true)
		stopAnimating()
		
		// Display Error in Alert Controller
		let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
		

} // end class


