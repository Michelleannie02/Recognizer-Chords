//
//  Counter.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 01/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Model */

import Foundation

/* Abstract:
Un contador que cuenta la cantidad de veces que fue presionado el botón 'play'.
*/

struct Counter {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var playButtonValue = 0
	
	

	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	mutating func incrementPlayButton() {
		playButtonValue += 1
	}
	
	
} // end struct


///// task: tomar los datos para realizar una solicitud web específica
//func chordMajorRequest(refAcordesMayores: String, gsRef: String, acordesMayores: [String]) {
//	
//	
//	// 1 - raconta los datos para realizar la solicitud
//	
//	// se conecta con FIREBASE (Google Cloud Storage)
//	let storage = Storage.storage()
//	
//	// Create a reference with an initial file path and name
//	let pathReference = storage.reference(withPath: refAcordesMayores)
//	
//	// crea una referencia al archivo que se desea descargar
//	let gsReference = storage.reference(forURL: gsRef)
//	
//	// gs://recognizer-chords.appspot.com/M/C4_dens4.mp3
//	
//	// Create a reference to the file you want to download
//	let acordesMayores = gsReference.child((acordesMayores.randomElement())!)
//	
//	print("🤡\(acordesMayores.name)")
//	
//	
//	
//	// 2 - SOLICITUD WEB A FIREBASE 🔥
//	
//	// Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
//	acordesMayores.getData(maxSize: 1 * 1024 * 1024) { data, error in
//		if let error = error {
//			// Uh-oh, an error occurred!
//		} else {
//			// Data for "images/island.jpg" is returned
//			let image = UIImage(data: data!)
//		}
//		
//		// almacena los datos de audio obtenidos dentro de la variable 'dataChord'
//		if let data =  data {
//			FirebaseClient.dataChord = data
//		}
//		
//		
//		
//		// test
//		print("😎datos obtenidos:\(data)")
//		print("💀hay errores?\(error)")
//		print("el nombre de la referencia es '\(acordesMayores.name)'")
//		print("el full path es: \(acordesMayores.fullPath)")
//		print("el bucket es : \(acordesMayores.bucket)")
//		
//		print("👍\(FirebaseClient.dataChord)")
//		
//		
//	}
//	
//}
//
/////////////////////////
///// Acordes Menores ///
/////////////////////////
//
//
///// task: tomar los datoa para realizar una solicitud web específica
//func chordMinorRequest(refAcordesMenores: String, gsRef: String, acordesMenores: [String]) {
//	
//	
//	// 1 - raconta los datos para realizar la solicitud
//	
//	// se conecta con FIREBASE (Google Cloud Storage)
//	let storage = Storage.storage()
//	
//	// Create a reference with an initial file path and name
//	let pathReference = storage.reference(withPath: refAcordesMenores)
//	
//	// crea una referencia al archivo que se desea descargar
//	let gsReference = storage.reference(forURL: gsRef)
//	
//	// gs://recognizer-chords.appspot.com/M/C4_dens4.mp3
//	
//	// Create a reference to the file you want to download
//	let acordesMenores = gsReference.child((acordesMenores.randomElement())!)
//	
//	print("🤡\(acordesMenores.name)")
//	
//	
//	
//	// 2 - SOLICITUD WEB A FIREBASE 🔥
//	
//	// Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
//	acordesMenores.getData(maxSize: 1 * 1024 * 1024) { data, error in
//		if let error = error {
//			// Uh-oh, an error occurred!
//		} else {
//			// Data for "images/island.jpg" is returned
//			let image = UIImage(data: data!)
//		}
//		
//		// almacena los datos de audio obtenidos dentro de la variable 'dataChord'
//		if let data =  data {
//			FirebaseClient.dataChord = data
//		}
//		
//		
//		
//		// test
//		print("😎datos obtenidos:\(data)")
//		print("💀hay errores?\(error)")
//		print("el nombre de la referencia es '\(acordesMenores.name)'")
//		print("el full path es: \(acordesMenores.fullPath)")
//		print("el bucket es : \(acordesMenores.bucket)")
//		
//		print("👍\(FirebaseClient.dataChord)")
//		
//		
//	}
//	
//}
//
//

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
