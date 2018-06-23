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
	
	/// UI ////////////////////////////////////////////////////
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
	
	
	/// AUDIO //////////////////////////////////////////////////////////////
	// reproductor de audio
	var audioPlayer: AVAudioPlayer?

	
	/// PERSISTENCIA (scores) ///////////////////////////////////////////////
	// TODO: core data!
	var scoreFirstScreen: Double!
	
	var scoreSecondScreen = Double()
	
	static var savedScores: [Int] = []
	
	static var protoPersistencia = Int() // luego borrar
	
	// el score actual es 8 ya que es el requisito para estar en la 2da pantalla
	var actualScore: Int = 8
	
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	/// menú superior ////////////////////////////////////////////////
	
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
		
		/// UI
		// prepara el estado de los elementos gráficos de la interfaz
		setUserInterface()
		
		/// AUTOLAYOUT
		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		setAutolayout()
		
		/// NETWORKING - request data audio chord 🚀
		 requestChordDataAudio()
		
	}
	

	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	

	
	/// task: ejectutarse cada vez que el botón 'major' es tapeado
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		
		/// 1- USER INTERFACE ///////////////////////////////////////////////////////////////
		
		// una vez tapeado el botón de mayor, todos los botones de acordes se deshabilitan
		if majorButtonWasTapped {
			disableChordsButtons()
		}
		
		/// 2- LÓGICA ///////////////////////////////////////////////////////////////////////
		
		// si sonó un acorde mayor y el usuario tapeó el botón de mayor, ACIERTO!...
		if FirebaseClient.aChordSounded == FirebaseClient.TypesOfChords.Major {
			
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
		} else {
			// caso contrario...
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
		}
		
		// el juego progresa o finaliza de acuerdo al desempeño del usuar
		progressOrGameOver()
		
		
		/// 3- PERSISTENCIA 💿 ///////////////////////////////////////////////////////////////
		
		// asigna el último socre a la variable ´protoPersistencia´
		SecondScreenViewController.protoPersistencia = Int(pointsBarView.currentValue) // 👈
		
		// añade al array de scores el valor actual de aciertos
		SecondScreenViewController.savedScores.append(Int(pointsBarView.currentValue))
		print("✔︎ Tu último score es de \(SecondScreenViewController.protoPersistencia)")
		
		
		/// 4- NETWORKING 🚀 /////////////////////////////////////////////////////////////////
		
		requestChordDataAudio()
	
	}
	
	/// task: ejectutarse cada vez que el botón 'minor' es tapeado
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
		
		/// 1- USER INTERFACE ///////////////////////////////////////////////////////////////
		if minorButtonWasTapped {
			disableChordsButtons()
			
		}
		
		/// 2- LÓGICA ///////////////////////////////////////////////////////////////////////
		
		// si sonó un acorde menor y el usuario tapeó el botón de menor, ACIERTO!...
		if FirebaseClient.aChordSounded == FirebaseClient.TypesOfChords.Minor {
			
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
			// se suma un punto al score
			actualScore += 1
			
			
		} else {
			// caso contrario...
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
			
		}
		
		// el juego progresa o finaliza de acuerdo al desempeño del usuario
		progressOrGameOver()
		
	
		/// 3- PERSISTENCIA 💿 ///////////////////////////////////////////////////////////////
		
		// asigna el último socre a la variable ´protoPersistencia´
		SecondScreenViewController.protoPersistencia = Int(pointsBarView.currentValue) // 👈
		print("✔︎ Tu último score es de \(SecondScreenViewController.protoPersistencia)")
		
		
		/// 4- NETWORKING 🚀 /////////////////////////////////////////////////////////////////
		
		// por último, realizar una nueva solicitud web
		requestChordDataAudio()
		
		
	}
	
	
	/// task: ejectutarse cada vez que el botón 'disminuído' es tapeado
	@IBAction func diminishedButtonPressed(_ sender: UIButton) {
		

		/// 1- USER INTERFACE ///////////////////////////////////////////////////////////////
		// una vez tapeado el botón de disminuído, todos los botones de acordes se deshabilitan
		if diminishedButtonWasTapped {
			disableChordsButtons()
		}
		
		
		
		
		/// 2- LÓGICA ///////////////////////////////////////////////////////////////////////
		// si sonó un acorde disminuído y el usuario tapeó el botón de disminuído, ACIERTO!
		if FirebaseClient.aChordSounded == FirebaseClient.TypesOfChords.Diminished {
			
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
		} else {
			
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
			
		}
		
		// el juego progresa o finaliza de acuerdo al desempeño del usuario
		progressOrGameOver()
		
		
		/// 3- PERSISTENCIA 💿 ///////////////////////////////////////////////////////////////
		
		// asigna el último socre a la variable ´protoPersistencia´
		SecondScreenViewController.protoPersistencia = Int(pointsBarView.currentValue) // 👈
		
		// añade al array de scores el valor actual de aciertos
		SecondScreenViewController.savedScores.append(Int(pointsBarView.currentValue))
		print("✔︎ Tu último score es de \(SecondScreenViewController.protoPersistencia)")
		
		
		/// 4- NETWORKING 🚀 /////////////////////////////////////////////////////////////////
		
		requestChordDataAudio()

	}
	
	/// task: ejectutarse cada vez que el botón 'aumentado' es tapeado
	@IBAction func augmentedButtonPressed(_ sender: UIButton) {
		
		/// 1- USER INTERFACE ///////////////////////////////////////////////////////////////
		
		// una vez tapeado el botón de mayor, todos los botones de acordes se deshabilitan
		if augmentedButtonWasTapped {
			disableChordsButtons()
		}
		
		
		/// 2- LÓGICA ///////////////////////////////////////////////////////////////////////
		
		// si sonó un acorde aumentado y el usuario tapeó el botón de aumentado, ACIERTO!...
		if FirebaseClient.aChordSounded == FirebaseClient.TypesOfChords.Augmented {
			
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
		} else {
	
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
		}
		
		// el juego progresa o finaliza de acuerdo al desempeño del usuario
		progressOrGameOver()
		

		/// 3- PERSISTENCIA 💿 ///////////////////////////////////////////////////////////////
		
		// asigna el último socre a la variable ´protoPersistencia´
		SecondScreenViewController.protoPersistencia = Int(pointsBarView.currentValue) // 👈
		
		// añade al array de scores el valor actual de aciertos
		SecondScreenViewController.savedScores.append(Int(pointsBarView.currentValue))
		print("✔︎ Tu último score es de \(SecondScreenViewController.protoPersistencia)")
		
		
		/// 4- NETWORKING 🚀 /////////////////////////////////////////////////////////////////
		
		requestChordDataAudio()
		
		
	}
	
	
	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		/// 1- USER INTERFACE ///////////////////////////////////////////////////////////////
		// habilita los botones de acordes
		majorButton.isEnabled = true
		minorButton.isEnabled = true
		diminishedButton.isEnabled = true
		augmentedButton.isEnabled = true
		

		/// 2- AUDIO ////////////////////////////////////////////////////////////////////////
		
		// a-toma los ÚLTIMOS datos de audio almacenados en memoria, ahora puestos en el reproductor
		do {
			audioPlayer = try AVAudioPlayer(data: FirebaseClient.dataChord)
			audioPlayer?.prepareToPlay()
			
		} catch let error as NSError {
			
			print(error.debugDescription)
		}
		
		
		// b-y los reproduc
		audioPlayer?.play()
		
		
	}

	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: computar los aciertos y errores del usuario en su sesión y actuar en consecuencia
	func progressOrGameOver() {
		
		/// PROGRESS...
		// si el usuario erró tres tres veces en su sesión, pierde
		if errorsBarView.currentValue == 3 {
			
			// espera 5 segundos antes de navegar hacia la siguiente pantalla
			Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: {(timer) in
				self.performSegue(withIdentifier: "to game over", sender: nil)
			}
				
			)}
		
		
		/// GAME OVER.
		// si el usuario acertó ocho veces en su sesión sube de nivel y pasa a la siguiente pantalla
		if pointsBarView.currentValue == 8 { // luego cambiar a 8
			
			// se deshabilitan los dos botones de acordes
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			
			
			
			/// timer-diapasón (VER)
			// espera 8 segundos antes de navegar hacia la siguiente pantalla...
			Timer.scheduledTimer(withTimeInterval: 6.0, repeats: false, block: {(timer) in
				
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
				
				// y por último navega hacia la próxima pantalla
				self.performSegue(withIdentifier: "next screen", sender: nil)
			})
			
			
			
		} // end if
	
	}
	
	/// task: deshabilitar todos los botones de acordes
	func disableChordsButtons() {
		
		majorButton.isEnabled = false
		minorButton.isEnabled = false
		diminishedButton.isEnabled = false
		augmentedButton.isEnabled = false
		
	}
	
	
	// task: realizar una solicitud web para obtener los datos de audio del acorde elegido
	func requestChordDataAudio() {
		
		
		// prepara el siguiente acorde que va a sonar y pasa el objeto 'FirstScreenViewController'
		FirebaseClient.sharedInstance().setupChord(firstScreen: nil, secondScreen: self)
		// se visibiliza el indicator de actividad (networking)
		startAnimating()
		// corrobora si la solicitud es exitosa o no
		checkIfTheRequestWasSuccesful()
		
		
	}
	
	
	/// task: comprobar si la última solicitud web fue exitosa o no y actualizar la UI dependiendo del resultado
	func checkIfTheRequestWasSuccesful() {
		
		FirebaseClient.sharedInstance().majorChordRequest { success, error in
			
			performUIUpdatesOnMain {
				
				if success {
					
					self.stopAnimating()
					
				} else {
					
					self.displayAlertView(error)
				}
				
			} // end dispatch
			
		} // end closure
		
		
		FirebaseClient.sharedInstance().minorChordRequest { success, error in
			
			performUIUpdatesOnMain {
				
				if success {
					
					self.stopAnimating()
					
				} else {
					
					self.displayAlertView(error)
				}
				
			} // end dispatch
			
		} // end closure
		
		FirebaseClient.sharedInstance().diminishedChordRequest { success, error in
			
			performUIUpdatesOnMain {
				
				if success {
					
					self.stopAnimating()
					
				} else {
					
					self.displayAlertView(error)
				}
				
			} // end dispatch
			
		} // end closure
		
		FirebaseClient.sharedInstance().augmentedChordRequest { success, error in
			
			performUIUpdatesOnMain {
				
				if success {
					
					self.stopAnimating()
					
				} else {
					
					self.displayAlertView(error)
				}
				
			} // end dispatch
			
		} // end closure
		
		
	} // end func
	
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



