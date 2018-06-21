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
La segunda pantalla de la aplicación. Contiene cuatro botones representando un los acordes mayor, menor, disminuído y aumentando más un botón de play.
*/

class SecondScreenViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// UI ELEMENTOS
	// información desplegada del menú
//	let chordsInfo = ChordsInfo()
	
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
	
	var buttonWasTapped = true
	
	// AUDIO ///////////////////////////////////////////////////////
	// reproductor de audio
	var audioPlayer: AVAudioPlayer?

	// NETWORKING //////////////////////////////////////////////////
	let firebase = FirebaseClient()

	
	
	// PERSISTENCIA (scores) ///////////////////////////////////////////////
	// TODO: core data!
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
	@IBOutlet weak var chordsInfoButton: UIButton!
	@IBOutlet weak var lastScoresButton: UIButton!

	
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
		setUserInterface()
		
		// en principio el indicador de actividad (networking) está oculto
		activityIndicator.isHidden = true
		
		// las contenedores con información acerca de acordes y puntaje también
//		chordsInfo.isHidden = true
		
		
		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		setAutolayout()
		
		/// newtorking - request data audio chord 🚀
		// prepara el primer acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		//firebase.setupChord(firstScreen: nil, secondScreen: self)
		
	}
	

	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
//	@IBAction func chordsInfoButtonPressed(_ sender: UIButton) {
//
//		print("🤼‍♀️ El boton fue presionado está en \(buttonWasTapped)")
//
//		// el área aparece
//		if buttonWasTapped {
////			chordsInfo.isHidden = false
////			elBotonFuePresionado = false
//
//			majorButton.isEnabled = false
//			minorButton.isEnabled = false
//			playButton.isEnabled = false
//
//			// el área desaparece
//		} else {
////			chordsInfo.isHidden = true
//			buttonWasTapped = true
//
//			majorButton.isEnabled = true
//			minorButton.isEnabled = true
//			playButton.isEnabled = true
//		}
//
//	}
	
//	@IBAction func scoresButtonPressed(_ sender: UIButton) {
//
//		print("🤼‍♀️ El boton fue presionado está en \(buttonWasTapped)")
//
//		// el área aparece
//		if buttonWasTapped {
////			chordsInfo.isHidden = false
//			buttonWasTapped = false
//
//			majorButton.isEnabled = false
//			minorButton.isEnabled = false
//			playButton.isEnabled = false
//
//			// el área desaparece
//		} else {
////			chordsInfo.isHidden = true
//			buttonWasTapped = true
//
//			majorButton.isEnabled = true
//			minorButton.isEnabled = true
//			playButton.isEnabled = true
//		}
//
//	}
	
	
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
		
		/// LÓGICA
		// si sonó un acorde mayor y el usuario tapeó el botón de mayor, ACIERTO!
		if FirebaseClient.aChordSounded == "major" {
			
			print("ACERTASTE!!!! SONó UN ACORDE MAYOR!!!!!!!!")
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
		} else {
			
			print("YERRASTE!!!!!!!!")
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
			
		}
		
		// la app se comporta dependiendo del desempeño del usuario
		progressOrGameOver()
		
		// NETWORKING 🚀
		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		//firebase.setupChord(firstScreen: nil, secondScreen: self)
		

		/// PERSISTENCIA score
		// asigna el último socre a la variable ´protoPersistencia´
		scoreSecondScreen = pointsBarView.currentValue // 👈
		
		print("✔︎ Tu último score es de \(totalScore)")
	
	}
	
	/// task: ejectutarse cada vez que el botón 'minor' es tapeado
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
		print("el botón de menor fue presionado")
		
		
		playButton.isHidden = false
		playButton.alpha = 1

		
		/// LÓGICA
		if minorButtonWasTapped {
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
			
		}
		
		// la app se comporta dependiendo del desempeño del usuario
		progressOrGameOver()
		
		/// CONTADOR
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
		
		// NETWORKING 🚀
		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		//firebase.setupChord(firstScreen: nil, secondScreen: self)

		
		/// PERSISTENCIA score
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

		
		// una vez tapeado el botón de disminuído, todos los botones de acordes se deshabilitan
		if diminishedButtonWasTapped {
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
		}
		
		/// CONTADOR
		// el contador del botón play se pone a 0
		counter.playButtonValue = 0
		
		/// NETWORKING 🚀
		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		//firebase.setupChord(firstScreen: nil, secondScreen: self)
		
		
		/// LÓGICA
		// si sonó un acorde menor y el usuario tapeó el botón de menor, ACIERTO!
		if FirebaseClient.aChordSounded == "diminished" {
			
			print("ACERTASTE!!!! SONó UN ACORDE DISMINUÍDO!!!!!!!!")
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
		} else {
			
			print("YERRASTE!!!!!!!!")
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
			
		}
		
		// la app se comporta dependiendo del desempeño del usuario
		progressOrGameOver()
		
		
		/// PERSISTENCIA 🚀
		// asigna el último socre a la variable ´protoPersistencia´
		totalScore = pointsBarView.currentValue // 👈
		print("✔︎ Tu último score es de \(totalScore)")

	}
	
	/// task: ejectutarse cada vez que el botón 'aumentado' es tapeado
	@IBAction func augmentedButtonPressed(_ sender: UIButton) {
		
		print("el botón de aumentado fue presionado")
		
		// cuando el usuario tapea el botón disminuído, el botón play vuelve a aparecer
		playButton.isHidden = false
		
		
		/// CONTADOR
		// el contador del botón play se pone a 0
		counter.playButtonValue = 0
		
		/// NETWORKING 🚀
		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		//firebase.setupChord(firstScreen: nil, secondScreen: self)
		
		/// LÓGICA
		// si sonó un acorde menor y el usuario tapeó el botón de menor, ACIERTO!
		if FirebaseClient.aChordSounded == "augmented" {
			
			print("ACERTASTE!!!! SONó UN ACORDE AUMENTADO!!!!!!!!")
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
		} else {
			
			print("YERRASTE!!!!!!!!")
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
			
		}
		
		// la app se comporta dependiendo del desempeño del usuario
		progressOrGameOver()
		

		/// PESISTENCIA score
		// asigna el último socre a la variable ´protoPersistencia´
		totalScore = pointsBarView.currentValue // 👈
		print("✔︎ Tu último score es de \(totalScore)")
		
	}
	
	
	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		// se visibiliza el indicator de actividad (networking)
//		startAnimating()
		
		majorButton.isEnabled = true
		minorButton.isEnabled = true
		diminishedButton.isEnabled = true
		augmentedButton.isEnabled = true
		
		
		/// CONTADOR
		counter.incrementPlayButton()
		print("✏️\(counter.playButtonValue)")
		
		// si el usuario toca 3 veces el botón de play, este desaparece
		if counter.playButtonValue == 50 { // cambiar luego a 3
			
			counter.playButtonValue = 0
			playButton.isHidden = true
			majorButton.isEnabled = true
			minorButton.isEnabled = true
		}
		
		
		// Audio //////////////////////////////////////////////////
		

		
				// 1-toma los ÚLTIMOS datos de audio almacenados en memoria, ahora puestos en el reproductor
		do {
			audioPlayer = try AVAudioPlayer(data: FirebaseClient.dataChord)
			audioPlayer?.prepareToPlay()
			
		} catch let error as NSError {
			
			print(error.debugDescription)
		}
		
		
		// 2-y los reproduc
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
			
			// espera 5 segundos antes de navegar hacia la siguiente pantalla
			Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: {(timer) in
				self.performSegue(withIdentifier: "ir a game over", sender: nil)
			}
				
			)}
		
		// si el usuario erró tres tres veces en su sesión, pierde
		if errorsBarView.currentValue == 3 {
			
			// espera 5 segundos antes de navegar hacia la siguiente pantalla
			Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: {(timer) in
				self.performSegue(withIdentifier: "ir a game over", sender: nil)
			}
				
			)}
	
	}
	
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
		
	/// esconde la barra de estado
	override var prefersStatusBarHidden: Bool { return true }
	
	
	/**
	Muestra al usuario un mensaje acerca de porqué el sonido no suena.
	
	- Parameter title: El título del error.
	- Parameter message: El mensaje acerca del error.
	
	*/
	func displayErrorAlert(_ title: String?, _ message: String?) {
		
		// Reset UI
		setUserInterface()
		stopAnimating()
		
		// Display Error in Alert Controller
		let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
	
} // end class



//*****************************************************************
// MARK: - Navigation (Segue)
//*****************************************************************

//extension FirstScreenViewController {
//	
//	// task: enviar a 'PhotoAlbumViewController' una serie de datos
//	override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
//		
//		if segue.identifier == "score first screen" {
//
//			// el destino de la transición, el 'PhotosAlbumViewController'
//			let secondScreenVC = segue.destination as! SecondScreenViewController
//
//			//			// el remitente será una coordenada (pin) puesto sobre el mapa
//			//			let coord = sender as! CLLocationCoordinate2D
//
//
//			//			// le pasa a 'PhotoAlbumViewController' los siguientes datos: ///////////////////////////////
//			//
//			//			/*
//			//			1- el controlador de datos (core data)
//			//			2- el pin coincidente
//			//			3- la coordenada de ese pin
//			//			4- las fotos recibidas desde flickr 'flickrPhotos:[FlickrImage]'
//			//			*/
//			//
//			//			// el controlador de datos
//			//			photoAlbumVC.dataController = dataController
//			//
//			//			// el pin coincidente..
//			//			photoAlbumVC.pin = pinToPass
//			//
//			//			// ..y su coordenada
//			//			photoAlbumVC.coordinateSelected = coord
//			//
//			//			// y pasa las fotos recibidas desde flickr
//			//			photoAlbumVC.flickrPhotos = flickrPhotos
//
//			secondScreenVC.scoreFirstScreen = protoPersistencia
//
//		} // end if
//		
//	} // end func
//	
//} // end ext



