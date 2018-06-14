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
	
	// UI ELEMENTOS
	// información desplegada del menú
	let chordsInfo = ChordsInfo()
	
	// la barra que me traje
	let pointsBarView = PointsView()
	let errorsBarView = ErrorsView()
	
	// una variable que contiene la cantidad de veces que fue presionado el botón 'play'
	var counter: Counter = Counter()
	
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
	
	
	// SCORES
	var scoreFirstScreen: Double!
	
	var scoreSecondScreen = Double()
	
	var totalScore: Double = 0 {
		
		didSet {
		
		//scoreSecondScreen += scoreFirstScreen
			
		}
	}

	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	/// menú superior ////////////////////////////////////////////////
	
	// los íconos de la barra de menú
	@IBOutlet weak var gClefButton: UIButton!
	@IBOutlet weak var lastScoresButton: UIButton!
	
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
		
		// prepara el estado de los elementos gráficos de la interfaz
		setUI()
		
		// en principio el indicador de actividad (networking) está oculto
		activityIndicator.isHidden = true
		
		// las contenedores con información acerca de acordes y puntaje también
		chordsInfo.isHidden = true
		
		//disabledButtons()
		
		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		setAutolayout()
		
		firebase.setupChord(firstScreen: nil, secondScreen: self)
		

		
	}
	

	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	@IBAction func chordsInfoButtonPressed(_ sender: UIButton) {
		
		print("🤼‍♀️ El boton fue presionado está en \(elBotonFuePresionado)")
		
		// el área aparece
		if elBotonFuePresionado {
			chordsInfo.isHidden = false
			elBotonFuePresionado = false
			
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			playButton.isEnabled = false
			
			// el área desaparece
		} else {
			chordsInfo.isHidden = true
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
			chordsInfo.isHidden = false
			elBotonFuePresionado = false
			
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			playButton.isEnabled = false
			
			// el área desaparece
		} else {
			chordsInfo.isHidden = true
			elBotonFuePresionado = true
			
			majorButton.isEnabled = true
			minorButton.isEnabled = true
			playButton.isEnabled = true
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
		
		// el contador del botón play se pone a 0
		counter.playButtonValue = 0
		
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
		
		
		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		firebase.setupChord(firstScreen: nil, secondScreen: self)
		
		// la app se comporta dependiendo del desempeño del usuario
		progressOrGameOver()
		
		// asigna el último socre a la variable ´protoPersistencia´
		scoreSecondScreen = pointsBarView.currentValue // 👈
		
		print("✔︎ Tu último score es de \(totalScore)")
	
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
		
		// el contador del botón play se pone a 0
		counter.playButtonValue = 0
		
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
		
		
		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		firebase.setupChord(firstScreen: nil, secondScreen: self)
		// la app se comporta dependiendo del desempeño del usuario
		progressOrGameOver()
		
		// asigna el último socre a la variable ´protoPersistencia´
		totalScore = pointsBarView.currentValue // 👈
		print("✔︎ Tu último score es de \(totalScore)")
		
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
		
		
		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		firebase.setupChord(firstScreen: nil, secondScreen: self)
		// la app se comporta dependiendo del desempeño del usuario
		progressOrGameOver()
		
		// asigna el último socre a la variable ´protoPersistencia´
		totalScore = pointsBarView.currentValue // 👈
		print("✔︎ Tu último score es de \(totalScore)")

	}
	
	/// task: ejectutarse cada vez que el botón 'aumentado' es tapeado
	@IBAction func augmentedButtonPressed(_ sender: UIButton) {
		
		print("el botón de aumentado fue presionado")
		
		// cuando el usuario tapea el botón disminuído, el botón play vuelve a aparecer
		playButton.isHidden = false
		playButton.alpha = 1

		// el contador del botón play se pone a 0
		counter.playButtonValue = 0
		
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
		
		
		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		firebase.setupChord(firstScreen: nil, secondScreen: self)
		
		// la app se comporta dependiendo del desempeño del usuario
		progressOrGameOver()
		
		// asigna el último socre a la variable ´protoPersistencia´
		totalScore = pointsBarView.currentValue // 👈
		print("✔︎ Tu último score es de \(totalScore)")
		
	}
	
	
	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		// se visibiliza el indicator de actividad (networking)
		startAnimating()
		
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
		
		
		// test - score de la pantalla anterior
		print("👻\(scoreFirstScreen)")
		
	}

	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: computar los aciertos y errores del usuario en su sesión y actuar en consecuencia
	func progressOrGameOver() {
		
		// si el usuario erró tres tres veces en su sesión, pierde
		if errorsBarView.currentValue == 3 {
			
			performSegue(withIdentifier: "ir a game over", sender: nil)
		}
		
		// si el usuario acertó ocho veces en su sesión sube de nivel y pasa a la siguiente pantalla
		if pointsBarView.currentValue == 2 { // luego cambiar a 8
			
			// avanza a la siguiente pantalla
			let controller = self.storyboard!.instantiateViewController(withIdentifier: "Transition View Controller")
			self.present(controller, animated: true, completion: nil)
		}
		
	}
	
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
		
		/// esconde la barra de estado
		override var prefersStatusBarHidden: Bool { return true }
	
} // end class





