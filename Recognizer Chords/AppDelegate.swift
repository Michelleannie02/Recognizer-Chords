//
//  AppDelegate.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 4/11/18.
//  Copyright © 2018 luko. All rights reserved.
//

/* Application */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	// representa la ventana de la aplicación
	var window: UIWindow?

	/// task: se ejecuta una vez que la aplicación terminó su etapa de ´lanzamiento´
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.

			return true
	}

} // end class


///* Abstract:
//La aplicación entra por el ´AppGuideViewController´
//*/
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//	// representa la ventana de la aplicación
//	var window: UIWindow?
//
//	/// task: se ejecuta una vez que la aplicación terminó su etapa de ´lanzamiento´
//	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//		// Override point for customization after application launch.
//
//		// "esto es para ver cómo construir nuestra app con código"
//		window = UIWindow()
//		// muestra la ventana
//		window?.makeKeyAndVisible()
//
//		//		let randonViewController = UIViewController()
//		//		// pone la supervista de color púrpura
//		//		randonViewController.view.backgroundColor = .purple
//
//		// el diseño del ´collection view´
//		let layout = UICollectionViewFlowLayout()
//		// pone el diseño de la colleción para que tenga desplazamiento horizontal
//		layout.scrollDirection = .horizontal
//		// se lo asigna al 'SwipingController'
//		let appGuideViewController = AppGuideViewController(collectionViewLayout: layout)
//
//		// hace que 'swipingController' sea el vc inicial
//		window?.rootViewController = appGuideViewController
//
//			return true
//	}
//
//} // end class

