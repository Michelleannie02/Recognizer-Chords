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
completar....
*/

//*****************************************************************
// MARK: - FirebaseClient (NSObject)
//*****************************************************************

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
	
	static var dataChord = Data()
	
	//*****************************************************************
	// MARK: - Audio Functions
	//*****************************************************************
	
	/// task: elegir, entre seis opciones, el acorde a sonar (puede ser uno mayor o uno menor)
	func setupChords(screen: UIViewController) {
		
		//TODO: investigar
		//		enum TipoDeAcorde: Int {
		//
		//			case mayor, menor, disminuido, aumentado
		//		}
		
		
		if screen.nibName == "1" {
			
			print("Me llaman de la primer pantalla, actuaré en consecuencia")
		}
		
		if screen.nibName == "2" {
			
			print("Me llaman de la segunda pantalla, actuaré en consecuencia")
		}
		
		if screen.nibName == "3" {
			
			print("Me llaman de la tercera pantalla, actuaré en consecuencia")
		}
		
		let tiposAcordes = ["mayor", "menor", "disminuido", "aumentado"]
		
		
		var acordeActual = tiposAcordes.randomElement()
		
		switch acordeActual {
			
		case "mayor":
			chordMajorRequest(refAcordesMayores: MajorChords.refAcordesMayores, gsRef: FirebaseClient.gsRef, acordesMayores: MajorChords.items)
		case "menor":
			chordMinorRequest(refAcordesMenores: MinorChords.refAcordesMenores, gsRef: FirebaseClient.gsRef, acordesMenores: MinorChords.items)
		case "disminuido":
			chordMinorRequest(refAcordesMenores: DiminishedChords.refAcordesDisminuidos, gsRef: FirebaseClient.gsRef, acordesMenores: DiminishedChords.items)
		case "aumentado":
			chordMinorRequest(refAcordesMenores: AugmentedChords.refAcordesAumentados, gsRef: FirebaseClient.gsRef, acordesMenores: AugmentedChords.items)
		default:
			print("")
		}
		
		
		// test
		print("EL ACORDE ELEGIDO ES DE TIPO: \(acordeActual)")
		
	}
	
	
	/// task: tomar los datos para realizar una solicitud web específica
	func chordMajorRequest(refAcordesMayores: String, gsRef: String, acordesMayores: [String]) {
		
		
		// 1 - raconta los datos para realizar la solicitud
		
		// se conecta con FIREBASE (Google Cloud Storage)
		let storage = Storage.storage()
		
		// Create a reference with an initial file path and name
		let pathReference = storage.reference(withPath: refAcordesMayores)
		
		// crea una referencia al archivo que se desea descargar
		let gsReference = storage.reference(forURL: gsRef)
		
		// gs://recognizer-chords.appspot.com/M/C4_dens4.mp3
		
		// Create a reference to the file you want to download
		let acordesMayores = gsReference.child((acordesMayores.randomElement())!)
		
		print("🤡\(acordesMayores.name)")
		
		
		
		// 2 - SOLICITUD WEB A FIREBASE 🔥
		
		// Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
		acordesMayores.getData(maxSize: 1 * 1024 * 1024) { data, error in
			if let error = error {
				// Uh-oh, an error occurred!
			} else {
				// Data for "images/island.jpg" is returned
				let image = UIImage(data: data!)
			}
			
			// almacena los datos de audio obtenidos dentro de la variable 'dataChord'
			if let data =  data {
				FirebaseClient.dataChord = data
			}
			
			
			
			// test
			print("😎datos obtenidos:\(data)")
			print("💀hay errores?\(error)")
			print("el nombre de la referencia es '\(acordesMayores.name)'")
			print("el full path es: \(acordesMayores.fullPath)")
			print("el bucket es : \(acordesMayores.bucket)")
			
			print("👍\(FirebaseClient.dataChord)")
			
			
		}
		
	}
	
	///////////////////////
	/// Acordes Menores ///
	///////////////////////
	
	
	/// task: tomar los datoa para realizar una solicitud web específica
	func chordMinorRequest(refAcordesMenores: String, gsRef: String, acordesMenores: [String]) {
		
		
		// 1 - raconta los datos para realizar la solicitud
		
		// se conecta con FIREBASE (Google Cloud Storage)
		let storage = Storage.storage()
		
		// Create a reference with an initial file path and name
		let pathReference = storage.reference(withPath: refAcordesMenores)
		
		// crea una referencia al archivo que se desea descargar
		let gsReference = storage.reference(forURL: gsRef)
		
		// gs://recognizer-chords.appspot.com/M/C4_dens4.mp3
		
		// Create a reference to the file you want to download
		let acordesMenores = gsReference.child((acordesMenores.randomElement())!)
		
		print("🤡\(acordesMenores.name)")
		
		
		
		// 2 - SOLICITUD WEB A FIREBASE 🔥
		
		// Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
		acordesMenores.getData(maxSize: 1 * 1024 * 1024) { data, error in
			if let error = error {
				// Uh-oh, an error occurred!
			} else {
				// Data for "images/island.jpg" is returned
				let image = UIImage(data: data!)
			}
			
			// almacena los datos de audio obtenidos dentro de la variable 'dataChord'
			if let data =  data {
				FirebaseClient.dataChord = data
			}
			
			
			
			// test
			print("😎datos obtenidos:\(data)")
			print("💀hay errores?\(error)")
			print("el nombre de la referencia es '\(acordesMenores.name)'")
			print("el full path es: \(acordesMenores.fullPath)")
			print("el bucket es : \(acordesMenores.bucket)")
			
			print("👍\(FirebaseClient.dataChord)")
			
			
		}
		
	}
	
	
	
	///////////////////////////
	/// Acordes Disminuídos ///
	///////////////////////////
	
	
	
	//	/// task: tomar los datoa para realizar una solicitud web específica
	//	func chordMinorRequest(refAcordesMenores: String, gsRef: String, acordesMenores: [String]) {
	//
	//
	//		// 1 - raconta los datos para realizar la solicitud
	//
	//		// se conecta con FIREBASE (Google Cloud Storage)
	//		let storage = Storage.storage()
	//
	//		// Create a reference with an initial file path and name
	//		let pathReference = storage.reference(withPath: refAcordesMenores)
	//
	//		// crea una referencia al archivo que se desea descargar
	//		let gsReference = storage.reference(forURL: gsRef)
	//
	//		// gs://recognizer-chords.appspot.com/M/C4_dens4.mp3
	//
	//		// Create a reference to the file you want to download
	//		let acordesMenores = gsReference.child((acordesMenores.randomElement())!)
	//
	//		print("🤡\(acordesMenores.name)")
	//
	//
	//
	//		// 2 - SOLICITUD WEB A FIREBASE 🔥
	//
	//		// Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
	//		acordesMenores.getData(maxSize: 1 * 1024 * 1024) { data, error in
	//			if let error = error {
	//				// Uh-oh, an error occurred!
	//			} else {
	//				// Data for "images/island.jpg" is returned
	//				let image = UIImage(data: data!)
	//			}
	//
	//			// almacena los datos de audio obtenidos dentro de la variable 'dataChord'
	//			if let data =  data {
	//				self.dataChord = data
	//			}
	//
	//
	//
	//			// test
	//			print("😎datos obtenidos:\(data)")
	//			print("💀hay errores?\(error)")
	//			print("el nombre de la referencia es '\(acordesMenores.name)'")
	//			print("el full path es: \(acordesMenores.fullPath)")
	//			print("el bucket es : \(acordesMenores.bucket)")
	//
	//			print("👍\(self.dataChord)")
	//
	//
	//		}
	//
	//	}
	
	
	
	
	
	
	
	//////////////////////////
	/// Acordes Aumentados ///
	//////////////////////////
	
	
	//	/// task: tomar los datoa para realizar una solicitud web específica
	//	func chordMinorRequest(refAcordesMenores: String, gsRef: String, acordesMenores: [String]) {
	//
	//
	//		// 1 - raconta los datos para realizar la solicitud
	//
	//		// se conecta con FIREBASE (Google Cloud Storage)
	//		let storage = Storage.storage()
	//
	//		// Create a reference with an initial file path and name
	//		let pathReference = storage.reference(withPath: refAcordesMenores)
	//
	//		// crea una referencia al archivo que se desea descargar
	//		let gsReference = storage.reference(forURL: gsRef)
	//
	//		// gs://recognizer-chords.appspot.com/M/C4_dens4.mp3
	//
	//		// Create a reference to the file you want to download
	//		let acordesMenores = gsReference.child((acordesMenores.randomElement())!)
	//
	//		print("🤡\(acordesMenores.name)")
	//
	//
	//
	//		// 2 - SOLICITUD WEB A FIREBASE 🔥
	//
	//		// Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
	//		acordesMenores.getData(maxSize: 1 * 1024 * 1024) { data, error in
	//			if let error = error {
	//				// Uh-oh, an error occurred!
	//			} else {
	//				// Data for "images/island.jpg" is returned
	//				let image = UIImage(data: data!)
	//			}
	//
	//			// almacena los datos de audio obtenidos dentro de la variable 'dataChord'
	//			if let data =  data {
	//				self.dataChord = data
	//			}
	//
	//
	//
	//			// test
	//			print("😎datos obtenidos:\(data)")
	//			print("💀hay errores?\(error)")
	//			print("el nombre de la referencia es '\(acordesMenores.name)'")
	//			print("el full path es: \(acordesMenores.fullPath)")
	//			print("el bucket es : \(acordesMenores.bucket)")
	//
	//			print("👍\(self.dataChord)")
	//
	//
	//		}
	//
	//	}

	
	
} // end class
