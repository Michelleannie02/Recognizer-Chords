//
//  FirebaseClient.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 10/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Foundation
import Firebase

/* Abstract:
Contiene métodos para realizar una solictud a Firebase para obtener un acorde de la base de datos.
Una vez obtenido los datos de audio de ese acorde crea una referencia (una propiedad) para almacenar temporalmente esos datos y disponerlos para luego usarlos.
*/


class FirebaseClient: NSObject {
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	override init() {
		super.init()
	}
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// los datos de audio del acorde obtenido
	static var dataChord = Data()
	
	// el tipo del último acorde elegido, en principio a nil
	static var aChordSounded: String? = nil
	
	
	//*****************************************************************
	// MARK: - Setup Chords of First Or Second Screen
	//*****************************************************************
	
	/**
	Prepara el acorde que va a sonar cuando el usuario presione 'play' tanto en la primera como en la segunda pantalla.
	
	- parameter firstScreen: el controlador de la primer pantalla.
	- parameter secondScreen: el controlador de la segunda pantalla.

	*/
	func setupChord(firstScreen: FirstScreenViewController? = nil, secondScreen: SecondScreenViewController? = nil) {


		// 1er pantalla /////////////////////////////////////////////

		// si 'setupChords' es llamado desde la 1er pantalla ejecuta la siguiente pieza...
		if firstScreen?.title == "1" {
			
			// los tipos de acordes disponibles en esta pantalla
			let typeChords = ["major", "minor"]
			

			// elige entre un acorde mayor o menor aleatoriamente
			let chordChosen = typeChords.randomElement()
			
			// test
			print("EL ACORDE ELEGIDO ENTRE MAYOR Y MENOR ES \(chordChosen)")

			// almacena el tipo de acorde que sonará en la variable ´aChordSounded´
			FirebaseClient.aChordSounded = chordChosen
			

			// ejecuta un caso u otro dependiendo del tipo del acorde elegido
			switch chordChosen {

			case "major":
				majorChordRequest(refMajorChords: MajorChords.refMajorChords, majorChords: MajorChords.items, completionHandlerForMajorChord: {(success, errorString) in })

			case "minor":
				minorChordRequest(refMinorChords: MinorChords.refMinorChords, minorChords: MinorChords.items, completionHandlerForMinorChord: {(success, errorString) in })

			default:
				print("")
			}


		// 2da pantalla /////////////////////////////////////////////

		// si 'setupChords' es llamado desde la 2da pantalla ejectua la siguiente pieza...
		} else if secondScreen?.title == "2" {


			// los acordes disponibles
			let typeChords = ["major", "minor", "diminished", "augmented"]

			// elige entre un acorde mayor, menor, dismunuido o aumentado aleatoriamente
			let chordChosen = typeChords.randomElement()

			// almacena el tipo de acorde que sonará en la variable ´aChordSounded´
			FirebaseClient.aChordSounded = chordChosen
			

			// ejecuta un caso u otro dependiendo del tipo del acorde elegido aleatoriamente
			switch chordChosen {

			case "major":
				majorChordRequest(refMajorChords: MajorChords.refMajorChords, majorChords: MajorChords.items, completionHandlerForMajorChord: {(success, errorString) in })

			case "minor":
				minorChordRequest(refMinorChords: MinorChords.refMinorChords, minorChords: MinorChords.items, completionHandlerForMinorChord: {(success, errorString) in })

			case "diminished":
				diminishedChordRequest(refDiminishedChords: DiminishedChords.refDiminishedChords, diminishedChords: DiminishedChords.items, completionHandlerForDiminishedChord: {(success, errorString) in })

			case "augmented":
				augmentedChordRequest(refAugmentedChords: AugmentedChords.refAugmentedChords, augmentedChords: AugmentedChords.items, completionHandlerForAugmentedChord: {(success, errorString) in })

			default:
				print("")
			}


		}


	} // end func
	
	
	
	//*****************************************************************
	// MARK: - Chords Requests
	//*****************************************************************
	
	
	// major chord request
	func majorChordRequest(refMajorChords: String? = nil, majorChords:[String]? = nil, completionHandlerForMajorChord: @escaping ( _ success: Bool ,_  errorString: String? ) -> Void) {
		
		
		// 1- se conecta con FIREBASE (Google Cloud Storage)
		let storage = Storage.storage()
		
		// 2- crea una referencia al archivo que se desea descargar
		let gsReference = storage.reference(forURL: "gs://recognizer-chords.appspot.com/" )
		
		
		// 3 - raconta los datos para realizar la solicitud
		
			// a - crea una referencia con un archivo inicial que contiene el path y el nombre
			_ = storage.reference(withPath: (MajorChords.refMajorChords))

			// b - crea una nueva referencia HIJA de la referencia anterior (para que sea la referencia del archivo que se quiere descargar)
			// y 'revuelve' y devuelve aletoriamente UNO de los tres elementos del array de acordes mayores
			let majorChords = gsReference.child((MajorChords.items.randomElement())!)
		
			// test
			print("🏄🏻‍♂️ AL PRESIONAR 'PLAY' SONARÁ EL ACORDE: \(majorChords.name)")
		
		
		// 4 - solicitud a Firebase 🔥
		
			// a - descarga los datos requeridos EN MEMORIA con un tamaño máximo permitido de 1MB
			majorChords.getData(maxSize: 1 * 1024 * 1024) { data, error in

				// handling errors
				if let error = error {
					
					completionHandlerForMajorChord(false, error.localizedDescription)
				
				} else {
					// c - almacena los datos de audio obtenidos dentro de la variable 'dataChord'
					FirebaseClient.dataChord = data! // DATOS DE AUDIO OBTENIDOS! 👏
					
					//test
					print("LOS DATOS OBTENIDOS EL ACORDE MAYOR SON: \(data)")
					
					// d - informa al completion handler que la solicitud fue exitiosa!
					completionHandlerForMajorChord(true, nil)
					
					
				}
	
				
				print("los datos obtenidos son: \(data), y el error \(error)")
		
		
		}
		
	}
	
	
	// minor chord request
	func minorChordRequest(refMinorChords: String? = nil , minorChords:[String]? = nil, completionHandlerForMinorChord: @escaping ( _ success: Bool ,_  errorString: String? ) -> Void) {
		
		// 1- se conecta con FIREBASE (Google Cloud Storage)
		let storage = Storage.storage()
		
		// 2- crea una referencia al archivo que se desea descargar
		let gsReference = storage.reference(forURL: "gs://recognizer-chords.appspot.com/" )
		
		
		// 3 - raconta los datos para realizar la solicitud
		
		// a - crea una referencia con un archivo inicial que contiene el path y el nombre
		_ = storage.reference(withPath: (MinorChords.refMinorChords))
		
		// b - crea una nueva referencia HIJA de la referencia anterior (para que sea la referencia del archivo que se quiere descargar)
		// y 'revuelve' y devuelve aletoriamente UNO de los tres elementos del array de acordes mayores
		let minorChords = gsReference.child((MinorChords.items.randomElement())!)
		
		// test
		print("🏄🏻‍♂️ AL PRESIONAR 'PLAY' SONARÁ EL ACORDE: \(minorChords.name)")
		
		
		// 4 - SOLICITUD WEB A FIREBASE 🔥
		
		// a - descarga los datos requeridos en memoria con un tamaño máximo permitido de 1MB
		minorChords.getData(maxSize: 1 * 1024 * 1024) { data, error in
			

			if let error = error {
				
				// TODO: consultar porqué no captura el error (al igual que las otras ramas similares)
				completionHandlerForMinorChord(false, error.localizedDescription)
				
			} else {
				// c - almacena los datos de audio obtenidos dentro de la variable 'dataChord'
				FirebaseClient.dataChord = data! // DATOS DE AUDIO OBTENIDOS! 👏
				
				//test
				print("LOS DATOS OBTENIDOS EL ACORDE menor SON: \(data)")
				
				// d - informa al completion handler que la solicitud fue exitiosa!
				completionHandlerForMinorChord(true, nil)
				
				
			}
		
			
		}

		
	}
	
	// diminished chord request
	func diminishedChordRequest(refDiminishedChords: String? = nil, diminishedChords:[String]? = nil,completionHandlerForDiminishedChord: @escaping ( _ success: Bool ,_  errorString: String? ) -> Void) {
		
		
		// 1- se conecta con FIREBASE (Google Cloud Storage)
		let storage = Storage.storage()
		
		// 2- crea una referencia al archivo que se desea descargar
		let gsReference = storage.reference(forURL: "gs://recognizer-chords.appspot.com/" )
		
		
		// 3 - raconta los datos para realizar la solicitud
		
		// a - crea una referencia con un archivo inicial que contiene el path y el nombre
		_ = storage.reference(withPath: (DiminishedChords.refDiminishedChords))
		
		// b - crea una nueva referencia HIJA de la referencia anterior (para que sea la referencia del archivo que se quiere descargar)
		// tira los 🎲 y devuelve aletoriamente UNO de los tres elementos del array de acordes mayores
		let diminishedChords = gsReference.child((DiminishedChords.items.randomElement())!)
		
		// test
		print("🏄🏻‍♂️ AL PRESIONAR 'PLAY' SONARÁ EL ACORDE: \(diminishedChords.name)")
		
		
		// 4 - solicitud a Firebase 🔥
		
		// a - descarga los datos requeridos EN MEMORIA con un tamaño máximo permitido de 1MB
		diminishedChords.getData(maxSize: 1 * 1024 * 1024) { data, error in
			
			
			if let error = error {
				
				completionHandlerForDiminishedChord(false, error.localizedDescription)
				
			} else {
				// c - almacena los datos de audio obtenidos dentro de la variable 'dataChord'
				FirebaseClient.dataChord = data! // DATOS DE AUDIO OBTENIDOS! 👏
				
				//test
				print("LOS DATOS OBTENIDOS EL ACORDE disminuído SON: \(data)")
				
				// d - informa al completion handler que la solicitud fue exitiosa!
				completionHandlerForDiminishedChord(true, nil)
				
				
			}
			
			
		}
		
		
	}
	
	// augmented chord request
	func augmentedChordRequest(refAugmentedChords: String? = nil , augmentedChords:[String]? = nil, completionHandlerForAugmentedChord: @escaping ( _ success: Bool ,_  errorString: String? ) -> Void) {
		
		
		// 1- se conecta con FIREBASE (Google Cloud Storage)
		let storage = Storage.storage()
		
		// 2- crea una referencia al archivo que se desea descargar
		let gsReference = storage.reference(forURL: "gs://recognizer-chords.appspot.com/" )
		
		
		// 3 - raconta los datos para realizar la solicitud
		
		// a - crea una referencia con un archivo inicial que contiene el path y el nombre
		_ = storage.reference(withPath: (AugmentedChords.refAugmentedChords))
		
		// b - crea una nueva referencia HIJA de la referencia anterior (para que sea la referencia del archivo que se quiere descargar)
		// tira los 🎲 y devuelve aletoriamente UNO de los tres elementos del array de acordes mayores
		let augmentedChords = gsReference.child((AugmentedChords.items.randomElement())!)
		
		// test
		print("🏄🏻‍♂️ AL PRESIONAR 'PLAY' SONARÁ EL ACORDE: \(augmentedChords.name)")
		
		
		// 4 - solicitud a Firebase 🔥
		
		// a - descarga los datos requeridos EN MEMORIA con un tamaño máximo permitido de 1MB
		augmentedChords.getData(maxSize: 1 * 1024 * 1024) { data, error in
			
			
			if let error = error {
				
				completionHandlerForAugmentedChord(false, error.localizedDescription)
				
			} else {
				// c - almacena los datos de audio obtenidos dentro de la variable 'dataChord'
				FirebaseClient.dataChord = data! // DATOS DE AUDIO OBTENIDOS! 👏
				
				//test
				print("LOS DATOS OBTENIDOS EL ACORDE aumentado SON: \(data)")
				
				// d - informa al completion handler que la solicitud fue exitiosa!
				completionHandlerForAugmentedChord(true, nil)
				
				
			}
			
			
		}
		

	}
	
	

	
	//*****************************************************************
	// MARK: - Shared Instance
	//*****************************************************************
	
	class func sharedInstance() -> FirebaseClient {
		
		struct Singleton {
			static var sharedInstance = FirebaseClient()
		}
		return Singleton.sharedInstance
	}

	
		
		
		
		
		
		

	
} // end class
