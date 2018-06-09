//
//  Helpers.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 04/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

/* Abstract:
Extiende la clase 'UIColor' añadiéndole un método que devuelve un color expresado en RGB.
*/

//*****************************************************************
// MARK: - UIColor Extension
//*****************************************************************

extension UIColor {
	
	/// devuelve un color expresado en RGB
	static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
		
		return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
		
	}
	
}

/* Abstract:
Extiende la clase 'UIView' añadiéndole un método que permite agregar restricciones a las vistas mediante el formato 'Auto Layour Visual Format'.
*/

//*****************************************************************
// MARK: - UIView Extension
//*****************************************************************

extension UIView {
	
	/**
	task: agregar constraints a la vistas usando 'Auto Layout Visual Format' 👍
	
	- parameter format: el formato 'ALVF'.
	- parameter views: las vistas a las que se aplican las restricciones.
	
	*/
	func addConstraintsWithFormat(format: String, views: UIView...) {
		
		/* 1 */
		// crea un diccionario de vistas
		var viewsDictionary = [String: UIView]()
		
		/* 2 */
		// enumera los diccionarios de la colección para iterarlos
		for (index, view) in views.enumerated() {
			
			// crea una clave que va a ser igual a cada nro de index
			let key = "v\(index)"
			
			// translatesAutoresizingMaskIntoConstraints: un valor booleano que determina si la máscara de aumento de tamaño de la vista se traduce en restricciones de diseño automático.
			view.translatesAutoresizingMaskIntoConstraints = false
			
			// le asigna a cada índice del diccionario la vista que le corresponde
			viewsDictionary[key] = view
			
		}
		
		/* 3 */
		// agrega múltiples constraints
		// este método toma un array de constraints [NSLayoutConstraint]
		// notar como le pasa todas la vistas que tienen constraints en un diccionario [String: UIView]
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(),metrics: nil, views: viewsDictionary))
		
	} // end mehtod
	
	
	
} // end ext



//*****************************************************************
// MARK: - Collection Randmo Element
//*****************************************************************

extension Collection where Index == Int {
	
	/**
	Picks a random element of the collection.
	
	- returns: A random element of the collection.
	*/
	func randomElement() -> Iterator.Element? {
		return isEmpty ? nil : self[Int(arc4random_uniform(UInt32(endIndex)))]
	}
	
}
