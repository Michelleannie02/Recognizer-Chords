//
//  AppDelegate.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 4/11/18.
//  Copyright © 2018 luko. All rights reserved.
//

/* Application */

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	// representa la ventana de la aplicación
	var window: UIWindow?

	/// task: se ejecuta una vez que la aplicación terminó su etapa de ´lanzamiento´
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		
		// la app ya esta asociada a firebase!
		FirebaseApp.configure()
		
		// obtiene una referencia al servicio de almacenamiento usando la app de Firebase predeterminada
		
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
			
			
			// test
			print("😎datos obtenidos:\(data)")
			print("💀hay errores?\(error)")
			print("el nombre de la referencia es '\(cMajor.name)'")
			print("el full path es: \(cMajor.fullPath)")
			print("el bucket es : \(cMajor.bucket)")
			
			
			
		}
		
		

			return true
	}

} // end class




