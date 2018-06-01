//
//  HeadphonesContainer.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 04/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* View */

import UIKit

/* Abstract:
Esta clase representa una vista que recomienda usar auriculares.
*/

class HeadphonesContainer: UIStackView {
	
	// 2 vistas:
	// headphonesImage: UIImageView, headphonesBest: UITextView
	
	/// la imágen del ícono de un auricular
	let headphonesImage: UIImageView = {
		
		// un rectángulo para contener el ícono del auricular
		let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
		let hi = UIImageView(frame: frame)
		hi.backgroundColor = .yellow
		hi.image = UIImage(named: "headphones_image")
		
		return hi
	}()
	
	/// un texto con la recomendación de usar auriculares
	let headphonesBest: UITextView = {
		
		// el rectángulo para contener la vista del texto
		let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
	
		// el tamaño del contenedor del texto
		let textContainerSize = CGSize(width: 50, height: 50)
		
		// el contenedor del texto con su tamaño ya configurado
		let textContainer = NSTextContainer(size: textContainerSize)
		
		// la vista del texto con su contenedor ya configurado
		let hb = UITextView(frame: frame, textContainer: textContainer)
		
		hb.text = "Para una mejor experiencia se recomienda usar auriculares."
		
		return hb
		
	}()
	

} // end class
