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

/* Abstract:
TODO: completar
*/

class SecondScreenViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// información desplegada del menú
	let ci = ChordsInfo()
	
	// la barra que me traje
	let pointsBarView = PointsView()
	let errorsBarView = ErrorsView()
	
	// una variable que contiene la cantidad de veces que fue presionado el botón 'play'
	var counter: Counter = Counter()
	
	// lenguaje actual
	var englishLanguage = true
	
	// los botones de acordes fueron tapeados
	var majorButtonWasTapped = true
	var minorButtonWasTapped = true
	var diminishedButtonWasTapped = true
	var augmentedButtonWasTapped = true
	
	var elBotonFuePresionado = true
	
	// reproductor de audio
	var audioPlayer: AVAudioPlayer?
	// los datos el acorde elegido

	let firebase = FirebaseClient()
	//var dataChord = FirebaseClient.dataChord

	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	/// menú superior ////////////////////////////////////////////////
	
	// los íconos de la barra de menú
	@IBOutlet weak var gClefButton: UIButton!
	@IBOutlet weak var lastScoresButton: UIButton!
	@IBOutlet weak var languageButton: UIButton!
	
	/// información desplegada del menú
	@IBOutlet weak var fourChordInfo: UICollectionView!
	@IBOutlet weak var settings: UITableView!
	@IBOutlet weak var lastScores: UIStackView!
	@IBOutlet weak var headphones: UIStackView!
	
	/// botones ////////////////////////////////////////////////
	
	// los cinco botones que contiene esta pantalla
	@IBOutlet weak var majorButton: UIButton!
	@IBOutlet weak var minorButton: UIButton!
	@IBOutlet weak var playButton: UIButton!
	@IBOutlet weak var diminishedButton: UIButton!
	@IBOutlet weak var augmentedButton: UIButton!
	
	
	// los tipos de botones disponibles
	// cada valor (tag) se corresponde con un tipo de botón diferente
	enum chordButtonType: Int {
		case major = 0, minor, diminished, augmented
	}
	
	// indicator de actividad (networking)
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	
	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
	
	// task: cargar la supervista..
	override func viewDidLoad() { // 🚪
		super.viewDidLoad()
		
		// las contenedores con información acerca de acordes y puntaje también
		ci.isHidden = true
		
		disabledButtons()
		
		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		autolayout()
		
		firebase.setupChord(firstScreen: nil, secondScreen: self)
		
	}
	

	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
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
	
	@IBAction func scoresButtonPressed(_ sender: UIButton) {
		
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
			languageButton.setTitle("EN", for: .normal)
			englishLanguage = false
			print("ahora la app está en español")
			// si está en español, cambiar a inglés
		} else {
			languageButton.setTitle("ES", for: .normal)
			print("ahora la app está en inglés")
			englishLanguage = true
		}
		
	}
	
	// Chords Button
	
//	@IBAction func playChordsButton(_ sender: UIButton) {
//		
//		switch(chordButtonType(rawValue: sender.tag)!) {
//		case .major:
//			playSound(rate: 0.5)
//		case .minor:
//			playSound(rate: 1.5)
//		case .diminished:
//			playSound(rate: 1000)
//		case .augmented:
//			playSound(rate: -1000)
//		}
//
//
//	}
	
	/// task: ejectutarse cada vez que el botón 'major' es tapeado
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón de mayor fue presionado")
		
		// cuando el usuario tapea el botón mayor, el botón play vuelva a aparecer
		playButton.isHidden = false
		playButton.alpha = 1
		
		
		// se ejecuta como estado inicial
		// y cada vez que el botón mayor es tapeado
		if majorButtonWasTapped {
			// deshabilita todos los botones de acordes
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
			
		}
		
		// el contador del botón play se pone a 0
		counter.playButtonValue = 0
	
	}
	
	/// task: ejectutarse cada vez que el botón 'minor' es tapeado
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
		print("el botón de menor fue presionado")
		
		
		playButton.isHidden = false
		playButton.alpha = 1

		
		if minorButtonWasTapped {
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
			
		}
		
		counter.playButtonValue = 0

	}
	
	
	/// task: ejectutarse cada vez que el botón 'disminuído' es tapeado
	@IBAction func diminishedButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón de disminuído fue presionado")
		
		// cuando el usuario tapea el botón disminuído, el botón play vuelve a aparecer
		playButton.isHidden = false
		playButton.alpha = 1

		
		
		if diminishedButtonWasTapped {
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
		}
		
		// el contador del botón play se pone a 0
		counter.playButtonValue = 0

	}
	
	/// task: ejectutarse cada vez que el botón 'aumentado' es tapeado
	@IBAction func augmentedButtonPressed(_ sender: UIButton) {
		
		print("el botón de aumentado fue presionado")
		
		// cuando el usuario tapea el botón disminuído, el botón play vuelve a aparecer
		playButton.isHidden = false
		playButton.alpha = 1

		
		// se ejecuta como estado inicial
		// y cada vez que el botón aumentado es tapeado
		if augmentedButtonWasTapped {
			// deshabilita todos los botones de acordes
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
			
		}
		
		// y el contador del botón play se pone a 0
		counter.playButtonValue = 0
		
	}
	
	
	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón de play fue presionado")
		
		majorButton.isEnabled = true
		minorButton.isEnabled = true
		
		
		// Contador ///////////////////////////////////////////////
		
		counter.incrementPlayButton()
		print("✏️\(counter.playButtonValue)")
		
		if counter.playButtonValue == 50 { // cambiar luego a 3
			
			counter.playButtonValue = 0
			playButton.isHidden = true
			majorButton.isEnabled = true
			minorButton.isEnabled = true
		}
		
		
		// Audio //////////////////////////////////////////////////
		
		// 1-prepara el acorde a sonar...
		// un acorde mayor o uno menor
		firebase.setupChord(firstScreen: nil, secondScreen: self)
		
		
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
	// MARK: - Methods
	//*****************************************************************
	
	/// task: deshabilitar los botones de acordes
	func disabledButtons() {
		
		// en principio los botones de mayor, menor, disminuído y aumentado están deshabilitados
		majorButton.isEnabled = false
		minorButton.isEnabled = false
		augmentedButton.isEnabled = false
		diminishedButton.isEnabled = false

	}
	
	
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
		
		/// esconde la barra de estado
		override var prefersStatusBarHidden: Bool { return true }
	
} // end class





