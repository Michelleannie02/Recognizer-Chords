//
//  FirstScreenViewController+Audio.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 04/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Foundation
import Firebase

extension FirstScreenViewController {
	
	
	//let audioPlayer: AVAudioPlayer!
	
	//*****************************************************************
	// MARK: - Audio Functions
	//*****************************************************************
	
	// task: prepara los acordes a sonar
	func setupChords() {

		
		// array de strings con solicitudes para traer sonidos de acordes mayores
		let refAcordesMayores = "M/C4_dens4.mp3"
		let refAcordesMenores = "m/Cm4_dens4.mp3"
		let gsRef = "gs://recognizer-chords.appspot.com/"

		var acordesMayores = ["M/C4_dens4.mp3", "M/E4_dens4.mp3", "M/G4_dens4.mp3"]
		var acordesMenores = ["m/Cm4_dens4.mp3","m/Em4_dens4.mp3","m/Gm4_dens4.mp3"]
		var acordesDisminuidos = ["d/Cdim4_dens4.mp3", "d/Edim4_dens4.mp3", "d/Gdim4_dens4.mp3"]
		var acordesAumentados = ["A/Caug4_dens4.mp3", "A/Eaug4_dens4.mp3", "A/Gaug4_dens4.mp3"]
		
		
		//TODO: investigar
//		enum TipoDeAcorde: Int {
//
//			case mayor, menor, disminuido, aumentado
//		}
		
		let tiposAcordes = ["mayor", "menor", "disminuido", "aumentado"]
		
		
		var acordeActual = tiposAcordes.randomElement()

		switch acordeActual {
			
			case "mayor":
			chordMajorRequest(refAcordesMayores: refAcordesMayores, gsRef: gsRef, acordesMayores: acordesMayores)
			case "menor":
			chordMinorRequest(refAcordesMenores: refAcordesMenores, gsRef: gsRef, acordesMenores: acordesMenores)
			case "disminuido":
			chordMinorRequest(refAcordesMenores: refAcordesMenores, gsRef: gsRef, acordesMenores: acordesMenores)
			case "aumentado":
			chordMinorRequest(refAcordesMenores: refAcordesMenores, gsRef: gsRef, acordesMenores: acordesMenores)
			default:
			print("")
		}
		
		
		// test
		print("EL ACORDE ELEGIDO ES DE TIPO: \(acordeActual)")

	}
	
	
	
		
		
	/// task: tomar los datoa para realizar una solicitud web específica
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
					self.dataChord = data
				}
				
				
				
				// test
				print("😎datos obtenidos:\(data)")
				print("💀hay errores?\(error)")
				print("el nombre de la referencia es '\(acordesMayores.name)'")
				print("el full path es: \(acordesMayores.fullPath)")
				print("el bucket es : \(acordesMayores.bucket)")
				
				print("👍\(self.dataChord)")
			
			
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
				self.dataChord = data
			}
			
			
			
			// test
			print("😎datos obtenidos:\(data)")
			print("💀hay errores?\(error)")
			print("el nombre de la referencia es '\(acordesMenores.name)'")
			print("el full path es: \(acordesMenores.fullPath)")
			print("el bucket es : \(acordesMenores.bucket)")
			
			print("👍\(self.dataChord)")
			
			
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
	
	
	
} //end class





