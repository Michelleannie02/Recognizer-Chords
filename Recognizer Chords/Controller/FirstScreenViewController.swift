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
import Firebase

/* Abstract:
La primer pantalla de la aplicación. Contiene dos botones representando un acorde mayor y un acorde menor más un botón de play.
*/

class FirstScreenViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// información desplegada del menú
	let ci = ChordsInfo()
	
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
	
	var elBotonFuePresionado = true
	
	// scores
	var actualScore: Int = 0
	
	// TODO: core data!
	var savedScores: [Int] = []
	
	// los tipos de botones disponibles
	// cada valor (tag) se corresponde con un tipo de botón diferente
	enum chordButtonType: Int {
		case major = 0, minor
	}
	
	// reproductor de audio
	var audioPlayer: AVAudioPlayer?
	var dataChord = Data()

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
		ci.isHidden = true
		

		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		autolayout()
		
		// tus scores
		print("🥉 tus scores son estos: \(savedScores)")
		
		// prepara los acordes de esta primer pantalla
		//setupChords()
		
		// TODO: que tome un nro aletorio 👈
		//Chords.arrayChords[2]
	
		
		setupChords()
		
		
		
		
    }

	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	// Menu Bar Buttons
	/// task: ejectutarse cada vez que el botón 'chords info' es tapeado
	@IBAction func chordsInfoButtonPressed(_ sender: UIButton) {
		
		print("🤼‍♀️ El boton fue presionado está en \(elBotonFuePresionado)")
		
		// el área aparece
		if elBotonFuePresionado {
			ci.isHidden = false
			elBotonFuePresionado = false
			
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			playButton.isEnabled = false
			
			// el área desaparece
		} else {
			ci.isHidden = true
			elBotonFuePresionado = true
			
			majorButton.isEnabled = true
			minorButton.isEnabled = true
			playButton.isEnabled = true
		}
		
	}
	
	/// task: ejectutarse cada vez que el botón 'last scores' es tapeado
	@IBAction func lastScoresButtonPressed(_ sender: UIButton) {
		
		print("🤼‍♀️ El boton fue presionado está en \(elBotonFuePresionado)")
		
		// el área aparece
		if elBotonFuePresionado {
			ci.isHidden = false
			elBotonFuePresionado = false
			
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			playButton.isEnabled = false
			
		// el área desaparece
		} else {
			ci.isHidden = true
			elBotonFuePresionado = true
			
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
			
			pasarDePantalla()
		}
		
		// va contando los aciertos
		actualScore = Int(pointsBarView.currentValue)
		print("tu score actual es \(actualScore)")
		
		savedScores.append(actualScore)
		print("🔌\(savedScores)")
	
		
	}
	
	
	func pasarDePantalla() {
		
		print("PASASTE A LA SIGUIENTE PANTALLA!!")
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



	}






	/// task: ejectutarse cada vez que el botón 'minor' es tapeado
	@IBAction func minorButtonPressed(_ sender: UIButton) {

		print("el botón de menor fue presionado")


		playButton.isHidden = false

		if minorButtonWasTapped {
			minorButton.isEnabled = false
			majorButton.isEnabled = false

		}

		counter.playButtonValue = 0


		// prueba
		errorsBarView.currentValue += 1
		print("ya erraste \(errorsBarView.currentValue) veces")

		if errorsBarView.currentValue == 3 {

			perdiste()
		}

		print("tu score fue de \(actualScore) puntos")

	}


	func perdiste() {

		print("game over")
	}


	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {

		print("el botón de play fue presionado")

		counter.incrementPlayButton()
		print("✏️\(counter.playButtonValue)")

		majorButton.isEnabled = true
		minorButton.isEnabled = true

		if counter.playButtonValue == 3 {

			counter.playButtonValue = 0
			playButton.isHidden = true
			majorButton.isEnabled = true
			minorButton.isEnabled = true
		}


//		// reproduce el sonido
//		Chords.audioPlayer.play()
		
		
		
		
		
		
		
		
		// busca el archivo de audio
		//let acordeMayorUrl = Bundle.main.url(forResource: "ab5", withExtension: "aiff")
		
		
		// lo pone el el reproductor
		do {
			audioPlayer = try AVAudioPlayer(data: self.dataChord)
			audioPlayer?.prepareToPlay()
			
			
		} catch let error as NSError {
			
			print(error.debugDescription)
		}
		
		
		// y lo reproduce
		audioPlayer?.play()
		
		
	
	}

	
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
	
		/// esconde la barra de estado
		override var prefersStatusBarHidden: Bool {
			return true
		}
		

} // end class


