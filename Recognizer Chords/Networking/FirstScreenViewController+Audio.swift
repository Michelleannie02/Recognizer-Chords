//
//  FirstScreenViewController+Audio.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 04/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Networking */

import Firebase

extension FirstScreenViewController {
	
	
	//let audioPlayer: AVAudioPlayer!
	
	//*****************************************************************
	// MARK: - Audio Functions
	//*****************************************************************
	
	// task: prepara los acordes a sonar
	func setupChords() {
		
		/////////////////////////
		///// Acordes Mayores ///
		/////////////////////////
		
		// SOLICITUD WEB A FIREBASE
		
		
		// se conecta con FIREBASE (Google Cloud Storage) 🔥
		let storage = Storage.storage()
		
		// Create a reference with an initial file path and name
		let pathReference = storage.reference(withPath: "M/C4_dens4.mp3")
		
		// crea una referencia al archivo que se desea descargar
		let gsReference = storage.reference(forURL: "gs://recognizer-chords.appspot.com/")
		
		// gs://recognizer-chords.appspot.com/M/C4_dens4.mp3
		
		// Create a reference to the file you want to download
		let cMajor = gsReference.child("M/C4_dens4.mp3")
		
		
		// Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
		cMajor.getData(maxSize: 1 * 1024 * 1024) { data, error in
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
			print("el nombre de la referencia es '\(cMajor.name)'")
			print("el full path es: \(cMajor.fullPath)")
			print("el bucket es : \(cMajor.bucket)")
			
			print("👍\(self.dataChord)")
			
			
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
		
		
	}
	
	
} //end class




//do {
//	audioPlayer = try AVAudioPlayer(contentsOf: Chords.acordeMayorUrl!)
//	audioPlayer.prepareToPlay()
//	
//	
//} catch let error as NSError {
//	
//	print(error.debugDescription)
//}
//
//

//
//
//let acordeMayor1 = {
//	
//	do {
//		audioPlayer = try AVAudioPlayer(contentsOf: Chords.acordeMayorUrl!)
//		audioPlayer.prepareToPlay()
//		
//		
//	} catch let error as NSError {
//		
//		print(error.debugDescription)
//	}
//	
//}()
//
//
//let acordeMayor2 = {
//	
//	do {
//		audioPlayer = try AVAudioPlayer(contentsOf: Chords.acordeMayor2Url!)
//		audioPlayer.prepareToPlay()
//		
//		
//	} catch let error as NSError {
//		
//		print(error.debugDescription)
//	}
//	
//}()
//
//let acordeMayor3 = {
//	
//	do {
//		audioPlayer = try AVAudioPlayer(contentsOf: Chords.acordeMayor3Url!)
//		audioPlayer.prepareToPlay()
//		
//		
//	} catch let error as NSError {
//		
//		print(error.debugDescription)
//	}
//	
//}()
//
//let acordeMayor4 = {
//	
//	
//	do {
//		audioPlayer = try AVAudioPlayer(contentsOf: Chords.acordeMayor4Url!)
//		audioPlayer.prepareToPlay()
//		
//		
//	} catch let error as NSError {
//		
//		print(error.debugDescription)
//	}
//	
//}()
//
//
//let arrayAcordes: [()] = [acordeMayor2, acordeMayor3, acordeMayor4]
//
//enum Prueba: Int {
//	
//	case acordeMayor1 = 0
//	case acordeMayor2
//	case acordeMayor3
//	case acordeMayor4
//	
//}


