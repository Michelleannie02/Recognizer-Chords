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

	
	// la barra que me traje
	let pointsBarView = PointsView()
	let errorsBarView = ErrorsView()

	// una variable que contiene la cantidad de veces que fue presionado el botón 'play'
	//var counter = Counter()
	
	// los botones de acordes fueron tapeados
	var majorButtonWasTapped = true
	var minorButtonWasTapped = true
	
	// indica si el botón ya fue tapeado
	var buttonWasTapped = true
	
	// scores
	var actualScore: Int = 0
	
	// AUDIO ///////////////////////////////////////////////////////
	// reproductor de audio
	var audioPlayer: AVAudioPlayer?
	
	// PERSISTENCIA (scores) ///////////////////////////////////////////////
	// TODO: core data!
	
	static var protoPersistencia = Int() // luego borrar
	
	static var savedScores: [Int] = []
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************

	// los íconos de la barra de menú
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
	
	/// task: cargar la supervista..
    override func viewDidLoad() {
        super.viewDidLoad()
		
		/// user interface elements
		// prepara el estado de los elementos gráficos de la interfaz
		setUserInterface()
		
		/// autolayout
		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		setAutolayout()
		
		/// newtorking - request data audio chord 🚀
		// prepara el primer acorde que va a sonar y pasa información sobre este controlador (un acorde mayor o uno menor)
		FirebaseClient.sharedInstance().setupChord(firstScreen: self, secondScreen: nil)
		
		// se anima el indicador de actividad
		startAnimating()
		
		/// newtorking - check request
		// corrobora si la última solicitud web fue exitosa o no
		FirebaseClient.sharedInstance().chordRequest { (success, errorString) in

				// ejecuta este bloque en la cola principal (dispatch)
				performUIUpdatesOnMain {
				// si la solicitud fue exitosa
				if success {
					
					print("ggg")
					// detener el indicador de actividad
					self.stopAnimating()
				

				// si falló
				} else {
					
					// mostrar un alert view
					self.displayAlertView(errorString)
				}

			} // end dispatch
		}
	}
	
	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	
	// Major, Minor & Play Buttons
	
	/// task: ejectutarse cada vez que el botón 'major' es tapeado
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		

		// test
		print("🎱 el botón de mayor fue presionado")

		// cuando el usuario tapea el botón mayor, el botón play vuelva a aparecer
		playButton.isHidden = false


		if majorButtonWasTapped {
			majorButton.isEnabled = false
			minorButton.isEnabled = false

		}

		// el contador del botón play se pone a 0
		//counter.playButtonValue = 0

		// si sonó un acorde menor y el usuario tapeó el botón de menor, ACIERTO!...
		if FirebaseClient.aChordSounded == "major" {
			
			print("ACERTASTE!!!! SONó UN ACORDE MAYOR!!!!!!!!")
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
		} else {
			// caso contrario...
			print("YERRASTE!!!!!!!!")
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
			
		}
		
		// NETWORKING 🚀
		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		FirebaseClient.sharedInstance().setupChord(firstScreen: self, secondScreen: nil)
		// se visibiliza el indicator de actividad (networking)
//		startAnimating() // REQUERIDO pero no lo pongo a propósito
		
		//destinationRequests()
		
		// la app se comporta dependiendo del desempeño del usuario
		progressOrGameOver()
		
		
		
		// PERSISTENCIA 💿
		// asigna el último socre a la variable ´protoPersistencia´
		FirstScreenViewController.protoPersistencia = Int(pointsBarView.currentValue) // 👈
		
		// añade al array de scores el valor actual de aciertos
		FirstScreenViewController.savedScores.append(Int(pointsBarView.currentValue))
		print("✔︎ Tu último score es de \(FirstScreenViewController.protoPersistencia)")

	}


	/// task: ejectutarse cada vez que el botón 'minor' es tapeado
	@IBAction func minorButtonPressed(_ sender: UIButton) {

		print("el botón de menor fue presionado")


		playButton.isHidden = false
		minorButton.alpha = 0.8

		
		// una vez tapeado el botón de menor, todos los botones de acordes se deshabilitan
		if minorButtonWasTapped {
			minorButton.isEnabled = false
			majorButton.isEnabled = false

		}
		
		/// CONTADOR
		// el contador del botón play se pone a 0
		//counter.playButtonValue = 0
		
		/// NETWORKING 🚀
		// prepara el siguiente acorde que va a sonar y pasa información sobre este controlador
		// un acorde mayor o uno menor
		FirebaseClient.sharedInstance().setupChord(firstScreen: self, secondScreen: nil)
		
		//destinationRequests()
		
		
		/// LÓGICA
		// si sonó un acorde menor y el usuario tapeó el botón de menor, ACIERTO!...
		if FirebaseClient.aChordSounded == "minor" {
			
			print("ACERTASTE!!!! SONó UN ACORDE MENOR!!!!!!!!")
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
			// se suma un punto al score
			actualScore += 1
			
			// test
			print("✏️ Ya acertaste \(actualScore)")
			
		} else {
			// caso contrario...
			print("YERRASTE!!!!!!!!")
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
			
		}
		
		// la app se comporta dependiendo del desempeño del usuario
		progressOrGameOver()
		

		/// PESISTENCIA score
		// asigna el último socre a la variable ´protoPersistencia´
		FirstScreenViewController.protoPersistencia = Int(pointsBarView.currentValue) // 👈
		print("✔︎ Tu último score es de \(FirstScreenViewController.protoPersistencia)")
		
	}
	
	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		
		majorButton.isEnabled = true
		print("🤼‍♀️ el boton mayor esta habilitado? \(majorButton.isEnabled)")
		minorButton.isEnabled = true
		

		// Contador ///////////////////////////////////////////////
		
		// cada vez que se tapea el botón de play se incrementa en 1 el contador
//		counter.incrementPlayButton()
		//print("✏️\(counter.playButtonValue)")

		
		// Audio //////////////////////////////////////////////////
		
		
		// 1-toma los ÚLTIMOS datos de audio almacenados en memoria, ahora puestos en el reproductor
		do {
			audioPlayer = try AVAudioPlayer(data: FirebaseClient.dataChord)
			audioPlayer?.prepareToPlay()
			
		} catch let error as NSError {
			
			print(error.debugDescription)
		}
		
		
		// 2-y los reproduce
		audioPlayer?.play()
		
	}

	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: computar los aciertos y errores del usuario en su sesión y actuar en consecuencia
	func progressOrGameOver() {
		
		// si el usuario erró 3 veces en su sesión, pierde
		if errorsBarView.currentValue == 3 {
			
			// espera 5 segundos antes de navegar hacia la siguiente pantalla
			Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: {(timer) in
				self.performSegue(withIdentifier: "to game over", sender: nil)
			}

		)}
		
		// si el usuario acertó ocho veces en su sesión sube de nivel y pasa a la siguiente pantalla
		if pointsBarView.currentValue == 8 { // luego cambiar a 8
			
			// se deshabilitan los dos botones de acordes
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			
			
			
			/// timer-diapasón (VER)
//			// espera 8 segundos antes de navegar hacia la siguiente pantalla...
//			Timer.scheduledTimer(withTimeInterval: 6.0, repeats: false, block: {(timer) in
//
//				// TODO: suena el diapasón!!!!
//				do {
//					self.audioPlayer = try AVAudioPlayer(data: FirebaseClient.dataChord)
//					self.audioPlayer?.prepareToPlay()
//
//					// 2-y los reproduce
//					self.audioPlayer?.play()
//
//				} catch let error as NSError {
//
//
//					print(error.debugDescription)
//				}
//
//				// y por último navega hacia la próxima pantalla
//				self.performSegue(withIdentifier: "next screen", sender: nil)
//			})
		
			
		
		} // end if

	
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
	func displayAlertView(_ error: String?) {
		
		if error != nil {
			
			let alertController = UIAlertController(title: "Request Error", message: error, preferredStyle: .alert)
			
			let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
				
			}
			alertController.addAction(cancelAction)
			
			let OKAction = UIAlertAction(title: "OK", style: .default) { action in
				
			}
			alertController.addAction(OKAction)
			
			self.present(alertController, animated: true) {
				
			}
		}
	}
		

} // end class



//*****************************************************************
// MARK: - Navigation (Segue)
//*****************************************************************

extension FirstScreenViewController {

	// task: enviar a 'PhotoAlbumViewController' una serie de datos
	override func prepare(for segue: UIStoryboardSegue,sender: Any?) {

		if segue.identifier == "score first screen" {

//			// el destino de la transición, el 'PhotosAlbumViewController'
//			let secondScreenVC = segue.destination as! SecondScreenViewController
//
//			// el remitente será una coordenada (pin) puesto sobre el mapa
//			let coord = sender as! CLLocationCoordinate2D
//
//
//			// le pasa a 'PhotoAlbumViewController' los siguientes datos: ///////////////////////////////
//
//			/*
//			1- el controlador de datos (core data)
//			2- el pin coincidente
//			3- la coordenada de ese pin
//			4- las fotos recibidas desde flickr 'flickrPhotos:[FlickrImage]'
//			*/
//
//			// el controlador de datos
//			photoAlbumVC.dataController = dataController
//
//			// el pin coincidente..
//			photoAlbumVC.pin = pinToPass
//
//			// ..y su coordenada
//			photoAlbumVC.coordinateSelected = coord
//
//			// y pasa las fotos recibidas desde flickr
//			photoAlbumVC.flickrPhotos = flickrPhotos

			//secondScreenVC.scoreFirstScreen = protoPersistencia

		} // end if

	} // end func

} // end ext


