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
		
		
		//TODO: investigar
//		enum TipoDeAcorde: [String] {
//
//			case mayor, menor, disminuido, aumentado
//
//		}
//
//		switch TipoDeAcorde() {
//			case mayor:
//				["M/C4_dens4.mp3", "M/E4_dens4.mp3", "M/G4_dens4.mp3"]
//			case menor:
//				["m/Cm4_dens4.mp3","m/Em4_dens4.mp3","m/Gm4_dens4.mp3"]
//			case disminuidos:
//				["A/Caug4_dens4.mp3", "A/Eaug4_dens4.mp3", "A/Gaug4_dens4.mp3"]
//			case aumentado:
//				["d/Cdim4_dens4.mp3", "d/Edim4_dens4.mp3", "d/Gdim4_dens4.mp3"]
//
//			default:
//			[]
//		}
//
		
		
		var acordesMayores = ["M/C4_dens4.mp3", "M/E4_dens4.mp3", "M/G4_dens4.mp3"]
		var acordesMenores = ["m/Cm4_dens4.mp3","m/Em4_dens4.mp3","m/Gm4_dens4.mp3"]
		var acordesDisminuidos = ["d/Cdim4_dens4.mp3", "d/Edim4_dens4.mp3", "d/Gdim4_dens4.mp3"]
		var acordesAumentados = ["A/Caug4_dens4.mp3", "A/Eaug4_dens4.mp3", "A/Gaug4_dens4.mp3"]
		
		solicitudAcorde(refAcordesMayores: refAcordesMayores, refAcordesMenores: nil, gsRef: gsRef, acordesMayores: acordesMayores, acordesMenores: nil)
		
		
	
			
		}
		
		
	/// task: tomar los datoa para realizar una solicitud web específica
	func solicitudAcorde(refAcordesMayores: String?,
						refAcordesMenores: String?,
						gsRef: String,
						acordesMayores: [String]?,
						acordesMenores: [String]?) {
			
		
		// 1 - raconta los datos para realizar la solicitud
		
		// se conecta con FIREBASE (Google Cloud Storage)
		let storage = Storage.storage()
			
		// Create a reference with an initial file path and name
		let pathReference = storage.reference(withPath: refAcordesMayores!)
			
		// crea una referencia al archivo que se desea descargar
		let gsReference = storage.reference(forURL: gsRef)
			
		// gs://recognizer-chords.appspot.com/M/C4_dens4.mp3
			
		// Create a reference to the file you want to download
		let acordesMayores = gsReference.child((acordesMayores?.randomElement())!)
		
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
		
		

		
		
		
		///////////////////////////
		/// Acordes Disminuídos ///
		///////////////////////////
		
	
	
	
		
		
		
		
		
		
		//////////////////////////
		/// Acordes Aumentados ///
		//////////////////////////
		

	
} //end class





