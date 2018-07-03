//
//  FirstScreenVC_Networking.swift
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

extension FirstScreenViewController {
	
	/// task: realizar una solicitud web para obtener los datos de audio del acorde elegido
	func requestChordDataAudio() {
		
		// prepara el siguiente acorde que va a sonar y pasa el objeto 'FirstScreenViewController'
		FirebaseClient.sharedInstance.setupChord(firstScreen: self, secondScreen: nil) { (chosenChord) in
			
			switch chosenChord {
				
				// comprueba si la solictud fue exitosa, tanto si salió un acorde mayor como uno menor
				case "major":
					self.checkIfTheRequestWasSuccesful(isMajor:true)
				
				case "minor":
					self.checkIfTheRequestWasSuccesful(isMajor:false)
				
				case .none:
					print("")
				
				case .some(_):
					print("")
			}
		}
		
		// se visibiliza el indicator de actividad (networking)
		startAnimating()
	}
	
	
	/// task: comprobar si la última solicitud web fue exitosa o no y actualizar la UI dependiendo del resultado
	func checkIfTheRequestWasSuccesful(isMajor: Bool) {
		
		// si la solicitud fue de un acorde mayor, ejecutar este bloque...
		if isMajor {
			
			FirebaseClient.sharedInstance.majorChordRequest { success, error in
			
			DispatchQueue.main.async {
				
				if success {
					
					self.stopAnimating()
					
				} else {
					
					self.displayAlertView(Errors.Message.requestError.title, error)
				}
			}
		}
		
		// .. sino este otro
		} else {
		
		// si la solicitud fue de un acorde menor, ejecutar este bloque...
			FirebaseClient.sharedInstance.minorChordRequest { success, error in
			
			DispatchQueue.main.async {
				
				if success {
					
					self.stopAnimating()
					
				} else {
					
					self.displayAlertView(Errors.Message.requestError.title, error)
				}
				
			}
			
		}
		
	}
		
} 
	
	
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
			self.present(alertController, animated: true) {}
		}
	}


	//*****************************************************************
	// MARK: - Internet Connection
	//*****************************************************************
	
	/// task: comprobar si hay conexión a internet y actuar en consecuencia
	func internetRecheability() {
		
		// si hay internet
		if recheability.connection != .none {
			
			print("hay conexión, se despide el alert view y se realiza una nueva solicitud")
			
		} else {
			
			DispatchQueue.main.async {
				
				// sigue sin haber conexión, mantener el alert view
				self.displayAlertView(Errors.Message.noInternet.title, Errors.Message.no_Internet.description)
				
			}
		}
	}
	
}
