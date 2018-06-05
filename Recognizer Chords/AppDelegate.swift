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
		// Override point for customization after application launch.
		
		// Use Firebase library to configure APIs
		FirebaseApp.configure()

			return true
	}

} // end class




