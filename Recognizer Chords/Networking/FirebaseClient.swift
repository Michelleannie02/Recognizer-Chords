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
	
	// los datos del audio del acorde obtenido
	static var dataChord = Data()
	
	//*****************************************************************
	// MARK: - Networking Methods
	//*****************************************************************
	
	/// task: ....
	func setupChords(firstScreen: FirstScreenViewController? = nil, secondScreen: SecondScreenViewController? = nil, thirdScreen: ThirdScreenViewController? = nil) {
		
		
		//TODO: investigar
		//		enum TipoDeAcorde: Int {
		//
		//			case mayor, menor, disminuido, aumentado
		//		}
		

		
		if firstScreen?.title == "1" {

			print("😇\(firstScreen?.title)")

			// test
			print("Me llaman de la primer pantalla, actuaré en consecuencia")

			let tiposAcordes = ["mayor", "menor"]

			// elige entre un acorde mayor o menor aleatoriamente
			let acordeActual = tiposAcordes.randomElement()
			
			print("EL ACORDE ELEGIDO ES\(acordeActual)")

			switch acordeActual {

			case "mayor":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesMayores: MajorChords.refAcordesMayores, acordesMayores: MajorChords.items)
			case "menor":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesMenores: MinorChords.refAcordesMenores, acordesMenores: MinorChords.items)
			default:
				print("")
			}


			// test
			print("EL ACORDE ELEGIDO ES DE TIPO: \(acordeActual)")



		} else if secondScreen?.title == "2" {

			print("Me llaman de la segunda pantalla, actuaré en consecuencia")
			print("😇\(secondScreen?.title)")

			// los acordes disponibles
			let tiposAcordes = ["mayor", "menor", "disminuido", "aumentado"]
			
			// elige entre un acorde mayor, menor, dismunuido o aumentado aleatoriamente
			let acordeActual = tiposAcordes.randomElement()

			switch acordeActual {

			case "mayor":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesMayores: MajorChords.refAcordesMayores, acordesMayores: MajorChords.items)

			case "menor":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesMenores: MinorChords.refAcordesMenores, acordesMenores: MinorChords.items)

			case "disminuido":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesDisminuidos: DiminishedChords.refAcordesDisminuidos, acordesDisminuidos: DiminishedChords.items)

			case "aumentados":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesAumentados: AugmentedChords.refAcordesAumentados, acordesAumentados: AugmentedChords.items)

			default:
				print("")
			}


			// test
			print("EL ACORDE ELEGIDO ES DE TIPO: \(acordeActual)")

		} else if thirdScreen?.title == "3" {

			// test
			print("Me llaman de la tercera pantalla, actuaré en consecuencia")

			let tiposAcordes = ["mayor", "menor", "disminuido", "aumentado", "etc"]

			let acordeActual = tiposAcordes.randomElement()
			
			
		}

		
	} // end func
	
	
	/// task: realizar la solicitud a firebase para traer los datos del acorde aleatoriamente elegido
	func chordRequest(gsRef: String,
					  refAcordesMayores: String? = nil,
					  acordesMayores: [String]? = nil,
					  refAcordesMenores: String? = nil,
					  acordesMenores: [String]? = nil,
					  refAcordesDisminuidos: String? = nil,
					  acordesDisminuidos: [String]? = nil,
					  refAcordesAumentados: String? = nil,
					  acordesAumentados: [String]? = nil) {
		
		
		// se conecta con FIREBASE (Google Cloud Storage)
		let storage = Storage.storage()
		
		// crea una referencia al archivo que se desea descargar
		let gsReference = storage.reference(forURL: gsRef)
		
		// si se salió un acorde MAYOR
		if refAcordesMayores != nil {
			
			print("👇\(refAcordesMayores)")
			
			// 1 - raconta los datos para realizar la solicitud ------------------------------------
			
			// Create a reference with an initial file path and name
			let pathReference = storage.reference(withPath: (MajorChords.refAcordesMayores))
			
			// Create a reference to the file you want to download
			let acordesMayores = gsReference.child((MajorChords.items.randomElement())!)
			
			print("🤡\(acordesMayores.name)")
			
			// 2 - SOLICITUD WEB A FIREBASE 🔥 ------------------------------------------------------
			
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
					FirebaseClient.dataChord = data // 👈
				}
				
			}
			
		}
	
		// si se salió un acorde MENOR
		else if refAcordesMenores != nil {
			
			print("👇\(refAcordesMenores)")
			
			// 1 - raconta los datos para realizar la solicitud ------------------------------------
			
			// Create a reference with an initial file path and name
			let pathReference = storage.reference(withPath: (MinorChords.refAcordesMenores))
			
			// Create a reference to the file you want to download
			let acordesMenores = gsReference.child((MinorChords.items.randomElement())!)
			
			print("🤡\(acordesMenores.name)")
			
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
					FirebaseClient.dataChord = data // 👈
				}
				

				
			}
			
		}
		
		
		
		// si se salió un acorde DISMINUIDO
		else if refAcordesDisminuidos != nil {
			
			print("👇\(refAcordesDisminuidos)")
			
			// 1 - raconta los datos para realizar la solicitud ------------------------------------
			
			// Create a reference with an initial file path and name
			let pathReference = storage.reference(withPath: (DiminishedChords.refAcordesDisminuidos))
			
			// Create a reference to the file you want to download
			let acordesDisminuidos = gsReference.child((DiminishedChords.items.randomElement())!)
			
			print("🤡\(acordesDisminuidos.name)")
			
			// Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
			acordesDisminuidos.getData(maxSize: 1 * 1024 * 1024) { data, error in
				if let error = error {
					// Uh-oh, an error occurred!
				} else {
					// Data for "images/island.jpg" is returned
					let image = UIImage(data: data!)
				}
				
				// almacena los datos de audio obtenidos dentro de la variable 'dataChord'
				if let data =  data {
					FirebaseClient.dataChord = data // 👈
				}

				
				
			}
			
		}
		
		
		
		// si se salió un acorde AUMENTADO
		else if refAcordesAumentados != nil {
			
			print("👇\(refAcordesAumentados)")
			
			// 1 - raconta los datos para realizar la solicitud ------------------------------------
			
			// Create a reference with an initial file path and name
			let pathReference = storage.reference(withPath: (AugmentedChords.refAcordesAumentados))
			
			// Create a reference to the file you want to download
			let acordesAumentados = gsReference.child((AugmentedChords.items.randomElement())!)
			
			print("🤡\(acordesAumentados.name)")
			
			// Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
			acordesAumentados.getData(maxSize: 1 * 1024 * 1024) { data, error in
				if let error = error {
					// Uh-oh, an error occurred!
				} else {
					// Data for "images/island.jpg" is returned
					let image = UIImage(data: data!)
				}
				
				// almacena los datos de audio obtenidos dentro de la variable 'dataChord'
				if let data =  data {
					FirebaseClient.dataChord = data // 👈
				}

				
				
			}
			
		}

		
		
		
		
		

	} // end func


	
} // end class
