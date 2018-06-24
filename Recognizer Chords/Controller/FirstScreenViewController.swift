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
		setAutolayout()
		
		/// Networking - request data audio chord 🚀 ..................
		requestChordDataAudio()
		
		/// Internet Recheability ..........................................
		internetRecheability()

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
			majorButton.isEnabled = false
			minorButton.isEnabled = false
		}

		
		/// 2- Logic ...................................................
		
		// si sonó un acorde mayor y el usuario tapeó el botón de mayor, ACIERTO!...
		if FirebaseClient.aChordSounded == FirebaseClient.TypesOfChords.Major {
			
			// da un paso en la barra de aciertos
			pointsBarView.currentValue += 1
			
			// agrega un punto a la variable 'scoreToAdd'
			scoreToAdd += 1
			
			// test
			print("👏Sumar un punto al score")
		
			
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
			minorButton.isEnabled = false
			majorButton.isEnabled = false

		}

		
		/// 2- Logic .....................................................
		
		// si sonó un acorde menor y el usuario tapeó el botón de menor, ACIERTO!...
		if FirebaseClient.aChordSounded == FirebaseClient.TypesOfChords.Minor {
			
			// un paso para la barra de aciertos
			pointsBarView.currentValue += 1
			
			// agrega un punto a la variable 'scoreToAdd'
			scoreToAdd += 1
			
			// test
			print("👏Sumar un punto al score")
			
			
		} else {
			// caso contrario...
			// un paso para la barra de errores
			errorsBarView.currentValue += 1
			
		}
		
		// // el juego progresa o finaliza de acuerdo a los aciertos u errores del usuario
		progressOrGameOver()
		

		
		
		/// 3- Networking 🚀 ..................................................
		
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


		/// GAME OVER.
		// si el usuario erró 3 veces en su sesión, pierde
		if errorsBarView.currentValue == 3 {
			
			
			
			
			
			
			
			// a-ENTONCES GRABA-PERSISTE el score del usuario 💿 👏
			addScoreToCoreData(hit: self.scoreToAdd)
			
			
			print("Game Over. Tu score fue de \(self.scoreToAdd) puntos.")
			
			
			
			
			
			
			
			
			// b-espera 5 segundos antes de navegar hacia la siguiente pantalla
			Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: {(timer) in
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
		
		print("tu score actual es de \(score)")
		
		// intenta guardar los cambios que registra el contexto (en este caso, que se agregó un nuevo objeto ´Score´)
		try? dataController.viewContext.save() // 💿
		
		
	}
	
	
	/// task: realizar una solicitud web para obtener los datos de audio del acorde elegido
	func requestChordDataAudio() {
		
		
		// prepara el siguiente acorde que va a sonar y pasa el objeto 'FirstScreenViewController'
		FirebaseClient.sharedInstance().setupChord(firstScreen: self, secondScreen: nil)
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
		

	} // end func
	
	

	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
	
	/// esconde la barra de estado
	override var prefersStatusBarHidden: Bool {
			return true
		}
	
	
	/**
	Muestra al usuario un mensaje acerca de porqué la solicitud falló.
	
	- Parameter title: El título del error.
	- Parameter message: El mensaje acerca del error.
	
	*/
	func displayAlertView(_ error: String?) {
		
		// si ocurre un error en la solicitud, mostrar una vista de alerta!
		if error != nil {
			
			let alertController = UIAlertController(title: "Request Error", message: error, preferredStyle: .alert)
			
			let OKAction = UIAlertAction(title: "OK", style: .default) { action in
				
				// TODO: qué tipo de acción implementar si hay un error con la solicitud??
				// ir a otra pantalla que diga, intente más tarde?
				
				
				// comprobar si ahora sí hay internet
				self.internetRecheability()
				
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
	
	
	
	
	//*****************************************************************
	// MARK: - Internet Connection
	//*****************************************************************
	
	
	func internetRecheability() {
		
		
		/// Internet Recheability ..........................................
		// que hacer cuando SÍ hay conexión a internet
		recheability.whenReachable = { _ in
			
			DispatchQueue.main.async {
				self.view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
				print("hay conexión!")
			}
		}
		
		// que hacer cuando NO hay internet
		recheability.whenUnreachable = { _ in
			
			DispatchQueue.main.async {
				self.displayAlertView("Su dispositivo no está conectado a internet")
				self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
				print("NO hay conexión!")
			}
			
		}
		
		// agrega un observador
		NotificationCenter.default.addObserver(self, selector: #selector(internetChanged), name: Notification.Name.reachabilityChanged, object: recheability)
		
		// comprueba si el notificador inició
		do {
			try recheability.startNotifier()
		} catch {
			print("Could not start notifier")
		}
		
		
		
		
	}
	
	/// task: observar si hay cambios en la conexión y actuar en consecuencia
	@objc func internetChanged(note: Notification) {
		
		let recheability = note.object as! Reachability
		
		// si hay internet
		if recheability.connection != .none {
			
			// si hay conexión wifi
			if recheability.connection == .wifi {
				
				DispatchQueue.main.async {
					self.view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
					print("hay conexión wifi")
					
					// si se reanuda la conexión realizar una nueva solicitud
					self.requestChordDataAudio()
					
					
				}
				// si hay conexión con datos móviles
			} else {
				
				DispatchQueue.main.async {
					self.view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
					print("hay conexión con cellular data")
					
					// si se reanuda la conexión realizar una nueva solicitud
					self.requestChordDataAudio()
				}
				
			}
			
			// si NO hay conexión a internet
		} else {
			
			
			DispatchQueue.main.async {
				
				
				self.displayAlertView("No hay conexión a internet")
				self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
				
			}
			
			
		}
		
	}
	
	
	
	
	

} // end ext


