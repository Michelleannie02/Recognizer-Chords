//
//  PointsBarCell
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 09/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class PointsBarCell: BaseCell {
	

	
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.image = UIImage(named: "failure_image")
		return iv
	}()
	
	// la configuración de la celda
	override func setupViews() {
		super.setupViews()
		
		// add view
		addSubview(imageView)
		// autolayout 📌
		// el ancho y el alto de la 'image view'
		addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView)
		addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView)
		
		// restricciones horizontales, en el centro de la celda

		
		//		// restricciones verticales
		//		addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
		
	}
	
}
