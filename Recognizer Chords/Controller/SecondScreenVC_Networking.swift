//
//  SecondScreenVC_Networking.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 24/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
Contiene métodos concernientes a las solicitudes de red de la clase.
*/

extension SecondScreenViewController {
	
	// task: realizar una solicitud web para obtener los datos de audio del acorde elegido
	func requestChordDataAudio() {
		
		
		// prepara el siguiente acorde que va a sonar y pasa el objeto 'FirstScreenViewController'
		FirebaseClient.sharedInstance().setupChord(firstScreen: nil, secondScreen: self) { (chosenChord) in
			
			if let chosenChord = chosenChord {
		
				self.checkIfTheRequestWasSuccesful(typeOfChord: chosenChord)

			}
		}

		// se visibiliza el indicator de actividad (networking)
		startAnimating()
		
	}
	
	
	/// task: comprobar si la última solicitud web fue exitosa o no y actualizar la UI dependiendo del resultado
	func checkIfTheRequestWasSuccesful(typeOfChord: String ) {
		
		
		if typeOfChord == FirebaseClient.TypesOfChords.Major {
			
		FirebaseClient.sharedInstance().majorChordRequest { success, error in
			
				performUIUpdatesOnMain {
					
					if success {
						
						self.stopAnimating()
						
					} else {
						
						self.displayAlertView(Errors.Message.requestError.title, error)
					}
					
				} // end dispatch
			
			} // end closure
		
		} // end if
		
		
		
		if typeOfChord == FirebaseClient.TypesOfChords.Minor {
		
			FirebaseClient.sharedInstance().minorChordRequest { success, error in
				
				performUIUpdatesOnMain {
					
					if success {
						
						self.stopAnimating()
						
					} else {
						
						self.displayAlertView(Errors.Message.requestError.title, error)
					}
					
				} // end dispatch
				
			} // end closure
		
		}
		
		
		
		if typeOfChord == FirebaseClient.TypesOfChords.Diminished {
			
		FirebaseClient.sharedInstance().diminishedChordRequest { success, error in
			
				performUIUpdatesOnMain {
					
					if success {
						
						self.stopAnimating()
						
					} else {
						
						self.displayAlertView(Errors.Message.requestError.title, error)
					}
					
				} // end dispatch
			
			} // end closure
			
		}
		
		
		if typeOfChord == FirebaseClient.TypesOfChords.Augmented {
			
		FirebaseClient.sharedInstance().augmentedChordRequest { success, error in
			
				performUIUpdatesOnMain {
					
					if success {
						
						self.stopAnimating()
						
					} else {
						
						self.displayAlertView(Errors.Message.requestError.title, error)
					}
					
				} // end dispatch
			
			} // end closure
		
		}
		
	} // end func
	
	//*****************************************************************
	// MARK: - Alert View
	//*****************************************************************
	
	/**
	Muestra al usuario un mensaje acerca de porqué la solicitud falló.
	
	- Parameter title: El título del error.
	- Parameter message: El mensaje acerca del error.
	
	*/
	func displayAlertView(_ title: String?, _ error: String?) {
		
		// si ocurre un error en la solicitud, mostrar una vista de alerta!
		if error != nil {
			
			let alertController = UIAlertController(title: title, message: error, preferredStyle: .alert)
			
			let OKAction = UIAlertAction(title: "OK", style: .default) { action in
				
				// comprobar ahora sí hay internet
				self.internetRecheability()
				
				// realizar una nueva solicitud
				self.requestChordDataAudio()
				
			}
			alertController.addAction(OKAction)
			
			self.present(alertController, animated: true) {
				
			}
		}
	}
	
	
	
	//*****************************************************************
	// MARK: - Internet Connection
	//*****************************************************************
	
	/// task: comprobar si hay conexión a internet y actuar en consecuencia
	func internetRecheability() {
		
		// si hay internet
		if recheability.connection != .none {

			print("hay conexión, se despide el alert view y se realizar una nueva solicitud")
			
		} else {
			
			DispatchQueue.main.async {
				// sigue sin haber conexión, mantener el alert view
				self.displayAlertView(Errors.Message.noInternet.title, Errors.Message.no_Internet.description)
				
			}
		}
	}
	
} // end class
