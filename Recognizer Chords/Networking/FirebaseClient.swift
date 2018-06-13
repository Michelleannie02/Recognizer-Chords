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
	// el nombre del acorde elegido
	static var aChordSounded: String? = ""
	
//	let firstScreenVC = FirstScreenViewController()
	
	//*****************************************************************
	// MARK: - Networking Methods
	//*****************************************************************
	
	/**
	Prepara el acorde que va a sonar cuando el usuario presione 'play'.
	
	- parameter firstScreen: el controlador de la primer pantalla.
	- parameter secondScreen: el controlador de la segunda pantalla.

	*/
	func setupChord(firstScreen: FirstScreenViewController? = nil, secondScreen: SecondScreenViewController? = nil) {
		
		
		// 1er pantalla /////////////////////////////////////////////
		
		// si 'setupChords' es llamado desde la 1er pantalla ejectua la siguiente pieza...
		if firstScreen?.title == "1" {
			
			// los tipos de acordes disponibles en esta pantalla
			let typeChords = ["major", "minor"]

			// elige entre un acorde mayor o menor aleatoriamente
			let chordChosen = typeChords.randomElement()
			
			// almacena el tipo de acorde que sonará en la variable ´aChordSounded´
			FirebaseClient.aChordSounded = chordChosen
			
			print("😂 EL ACORDE ELEGIDO ES \(chordChosen)")
			
			// ejecuta un caso u otro dependiendo del tipo del acorde elegido
			switch chordChosen {

			case "major":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesMayores: MajorChords.refMajorChords, acordesMayores: MajorChords.items)
			case "minor":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesMenores: MinorChords.refAcordesMenores, acordesMenores: MinorChords.items)
			default:
				print("")
			}

			
		// 2da pantalla /////////////////////////////////////////////
		
		// si 'setupChords' es llamado desde la 2da pantalla ejectua la siguiente pieza...
		} else if secondScreen?.title == "2" {

			
			// los acordes disponibles
			let typeChords = ["mayor", "menor", "disminuido", "aumentado"]
			
			// elige entre un acorde mayor, menor, dismunuido o aumentado aleatoriamente
			let chordChosen = typeChords.randomElement()
			
			// ejecuta un caso u otro dependiendo del tipo del acorde elegido
			switch chordChosen {

			case "mayor":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesMayores: MajorChords.refMajorChords, acordesMayores: MajorChords.items)

			case "menor":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesMenores: MinorChords.refAcordesMenores, acordesMenores: MinorChords.items)

			case "disminuido":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesDisminuidos: DiminishedChords.refAcordesDisminuidos, acordesDisminuidos: DiminishedChords.items)

			case "aumentados":
				chordRequest(gsRef: FirebaseClient.gsRef, refAcordesAumentados: AugmentedChords.refAcordesAumentados, acordesAumentados: AugmentedChords.items)

			default:
				print("")
			}

		
		}

		
	} // end func
	
	
	/// task: realizar la solicitud a firebase para traer los datos del acorde aleatoriamente elegido
	/**
	Realiza la solicitud a Firebase DEPENDIENDO de los datos que recibe el método en sus parámetros.
	
	- parameter gsRef: la ubicación del almacenamiento.
	- parameter refAcordesMayores: la referencia a los acordes mayores.
	- parameter acordesMayores: los acordes mayores contenidos en esa referencia.
	- parameter refAcordesMenores: la referencia a los acordes menores.
	- parameter acordesMenores: los acordes menores contenidos en esa referencia.
	- parameter refAcordesDisminuidos: la referencia a los acordes disminuídos.
	- parameter acordesDisminuidos: los acordes disminiuídos contenidos en esa referencia.
	- parameter refAcordesAumentados:la referencia a los acordes aumentados.
	- parameter acordesAumentados: los acordes aumentados contenidos en esa referencia.
	
	*/
	func chordRequest(gsRef: String,
					  refAcordesMayores: String? = nil,
					  acordesMayores: [String]? = nil,
					  refAcordesMenores: String? = nil,
					  acordesMenores: [String]? = nil,
					  refAcordesDisminuidos: String? = nil,
					  acordesDisminuidos: [String]? = nil,
					  refAcordesAumentados: String? = nil,
					  acordesAumentados: [String]? = nil) {
		
		
		// 1- se conecta con FIREBASE (Google Cloud Storage)
		let storage = Storage.storage()
		
		// 2- crea una referencia al archivo que se desea descargar
		let gsReference = storage.reference(forURL: gsRef)
		
		
		////////////////////////////////
		/// si salió un acorde MAYOR ///
		////////////////////////////////
		
		if refAcordesMayores != nil {
			
			// 3 - raconta los datos para realizar la solicitud ------------------------------------
			
			// a - crea una referencia con un archivo inicial que contiene el path y el nombre
			let pathReference = storage.reference(withPath: (MajorChords.refMajorChords))
			
			// b - crea una nueva referencia HIJA de la referencia anterior (para que sea la referencia del archivo que se quiere descargar)
			// y 'revuelve' y devuelve aletoriamente UNO de los tres elementos del array de acordes mayores
			let majorChords = gsReference.child((MajorChords.items.randomElement())!)
			
			// test
			print("🥋 se está ejecutando la rama que contiene tres acordes mayores. De los acordes mayores se obtuvieron los datos de este específicamente: \(majorChords.name)")
			
		
			
			
			
			
			
			
			
			
			
			// 4 - SOLICITUD WEB A FIREBASE 🔥 ------------------------------------------------------

			// a - descarga los datos requeridos en memoria con un tamaño máximo permitido de 1MB
			majorChords.getData(maxSize: 1 * 1024 * 1024) { data, error in
				
				// b - comprueba si ocurrió un error en la solicitud
				if let error = error {
					
					// Uh-oh, an error occurred!
					print(error.localizedDescription)
					// TODO: implementar un alert view en caso de que la solicitud web haya fallado
				}
				
				// c - comprueba si se obtuvieron los datos correctamente...y si se así
				if let data =  data {
					
					
					// d - almacena los datos de audio obtenidos dentro de la variable 'dataChord'
					FirebaseClient.dataChord = data // DATOS DE AUDIO OBTENIDOS! 👏
					
					// si la solicitud fue exitosa, entonces detener el indicator de actividad
					print("los datos de audio del acorde se obtuvieron, parar el indicador de actividad. los dato son\(data)")
					
		
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
				}
			}
		}
	
		////////////////////////////////
		/// si salió un acorde MENOR ///
		////////////////////////////////
		
		else if refAcordesMenores != nil {

			let pathReference = storage.reference(withPath: (MinorChords.refAcordesMenores))
			let acordesMenores = gsReference.child((MinorChords.items.randomElement())!)
			
			// test
			print("🥋 se está ejecutando la rama que contiene tres acordes menores. De los acordes menores se obtuvieron los datos de este específicamente: \(acordesMenores.name)")
			
			acordesMenores.getData(maxSize: 1 * 1024 * 1024) { data, error in
				if let error = error {
					
					print(error.localizedDescription)
				}
				
				if let data =  data {
					FirebaseClient.dataChord = data // 👈
					
					// si la solicitud fue exitosa, entonces detener el indicator de actividad
					print("Los datos de audio del acorde se obtuvieron, parar el indicador de actividad. Los datos son: \(data)")
					
					
				}
			}
		}
		

		/////////////////////////////////////
		/// si salió un acorde DISMINUÍDO ///
		/////////////////////////////////////
		
		else if refAcordesDisminuidos != nil {
			
			let pathReference = storage.reference(withPath: (DiminishedChords.refAcordesDisminuidos))
			let acordesDisminuidos = gsReference.child((DiminishedChords.items.randomElement())!)
			acordesDisminuidos.getData(maxSize: 1 * 1024 * 1024) { data, error in
				
				if let error = error {
					print(error.localizedDescription)
				}
				
				if let data =  data {
					FirebaseClient.dataChord = data // 👈
					
					// si la solicitud fue exitosa, entonces detener el indicator de actividad
					print("los datos de audio del acorde se obtuvieron, parar el indicador de actividad. los dato son\(data)")
				}
			}
		}
		
		
		////////////////////////////////////
		/// si salió un acorde AUMENTADO ///
		////////////////////////////////////
		
		else if refAcordesAumentados != nil {
			
			let pathReference = storage.reference(withPath: (AugmentedChords.refAcordesAumentados))
			let acordesAumentados = gsReference.child((AugmentedChords.items.randomElement())!)
			acordesAumentados.getData(maxSize: 1 * 1024 * 1024) { data, error in
				if let error = error {
					print(error.localizedDescription)
				}
				
				if let data =  data {
					FirebaseClient.dataChord = data // 👈
					
					// si la solicitud fue exitosa, entonces detener el indicator de actividad
					print("los datos de audio del acorde se obtuvieron, parar el indicador de actividad. los dato son\(data)")
				}
			}
		}

	
	} // end func


	
} // end class
