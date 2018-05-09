//
//  AppDelegate.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 4/11/18.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	// representa la ventana de la aplicación
	var window: UIWindow?
	
	/// task: se ejecuta una vez que la aplicación terminó su etapa de ´lanzamiento´
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		// crea la ventana de la aplicación
		window = UIWindow(frame: UIScreen.main.bounds)
		// la hace visible
		window?.makeKeyAndVisible()
		
		// una clase para organizar el diseño de un ´collection view´
		let layout = UICollectionViewFlowLayout()
		
		// asigna el controlador raíz al controlador de navegación
		// el controlador raíz en este caso es un ´UINavigationController´
		// por lo que al inicializarlo hay que pasarle el objeto 'UICollectionViewFlowLayout'
		// window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout)) // TODO: implementar luego
		
		// devuelve la ventana de la aplicación ya configurada
		return true
		
	}
	
} // end class



