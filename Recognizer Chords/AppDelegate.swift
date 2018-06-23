//
//  AppDelegate.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 4/11/18.
//  Copyright © 2018 luko. All rights reserved.
//

/* App */

import UIKit
import Firebase

//*****************************************************************
// MARK: - AppDelegate: UIResponder, UIApplicationDelegate
//*****************************************************************

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	

	// representa la ventana de la aplicación
	var window: UIWindow?
	
	/// CORE DATA
	// configura cual es el Modelo de esta aplicación
	let dataController = DataController(modelName: "RecognizerChords")


	//*****************************************************************
	// MARK: - UIApplication Delegate
	//*****************************************************************
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		/// FIREBASE
		// asocia la app a Firebase 🔥
		FirebaseApp.configure()
		
		
		/// CORE DATA
		// carga el almacen persistente
		dataController.load()
		
		// apenas arranca la aplicación...
		// inyecta el 'dataController' en el 'TravelLocationsMapViewController'
		//let navigationController = window?.rootViewController as! UINavigationController
		//let travelLocationsViewController = navigationController.topViewController as! TravelLocationsMapViewController
		//travelLocationsViewController.dataController = dataController
		
		return true
	}
	
	// cuando la aplicación entró en segundo plano se guarda el estado del contexto 💿
	func applicationDidEnterBackground(_ application: UIApplication) {
		
		saveViewContext()
	}
	
	// cuando la aplicación está por morir guarda el estado del contexto 💿
	func applicationWillTerminate(_ application: UIApplication) {
		
		saveViewContext()
	}
	
	//*****************************************************************
	// MARK: - Core Data - Save View Context
	//*****************************************************************
	
	/// task: guardar el contexto
	func saveViewContext() {
		try? dataController.viewContext.save() // 💿
	}

} // end class

/*
PERSISTENCIA:

Momentos en los que se persisten los datos del score obtenido por el usuario en una sesión de juego:

1- cuando la aplicación entra en segundo plano
2- cuando la aplicación está por morir
3- cada 30 segundos (autosave)
4- cuando el usuario pierde

*/




