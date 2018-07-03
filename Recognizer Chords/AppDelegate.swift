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
	
	/// Core Data
	// configura cual es el Modelo de esta aplicación
	let dataController = DataController(modelName: "RecognizerChords")

	//*****************************************************************
	// MARK: - UIApplication Delegate
	//*****************************************************************
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		/// Firebase ..................................................
		// asocia la app a Firebase 🔥
		FirebaseApp.configure()

		/// Core Data .................................................
		// apenas arranca la app carga los datos persistidos (el almacén persistente - los datos persistidos)
		dataController.load()
		// inyecta la clase que gestiona core data en la propiedad 'dataController' de 'FirstScreenViewController'
		let firstViewController = window?.rootViewController as! FirstScreenViewController
		firstViewController.dataController = dataController
		
		/// NSUserDefaults ............................................
		checkFirstLaunch()
		
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
	// MARK: - User Defaults
	//*****************************************************************
	
	/// task: comprueba si es la primera vez que la app se lanzó o no
	func checkFirstLaunch() {
		
		if (UserDefaults().bool(forKey: "hasLaunchedBefore")) {
			
			debugPrint("App has launched before")
			
			} else {
			
			debugPrint("This is the first launch ever!")
			// si es la primera vez que la app se lanza, crear tres objetos score
			let _ = Score.init(hits: 0, context: dataController.viewContext)
			let _ = Score.init(hits: 0, context: dataController.viewContext)
			let _ = Score.init(hits: 0, context: dataController.viewContext)

			UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
			UserDefaults.standard.synchronize()
		}
	}
	
	//*****************************************************************
	// MARK: - Core Data
	//*****************************************************************
	
	/// task: guardar el contexto
	func saveViewContext() {
		try? dataController.viewContext.save() // 💿
	}

} // end class





