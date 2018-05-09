//
//  ScoreBarCell.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 09/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit


//*****************************************************************
// MARK: - Menu Bar Cell Class
//*****************************************************************

class ScoreBarCell: BaseCell {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	/// la imagen de uno de los íconos de la barra de menú
	let imageView: UIImageView = {
		
		let iv = UIImageView()
		iv.image = UIImage(named: "home")
		return iv
		
	}()
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: configurar las vistas, en este caso, las celdas
	override func setupViews() {
		// notar como usa un método definido en su superclase 👈
		super.setupViews()
		
		// agrega la vista de la imágen de la celda
		addSubview(imageView)
		
		// imageView AUTOLAYOUT 📌 ///////////////////////////////////////
		
		// las restricciones horizontales..
		addConstraintsWithFormat(format: "H:|[v0(28)]|", views: imageView)
		// y las verticales
		addConstraintsWithFormat(format: "V:|[v0(28)]|", views: imageView)
		
		//////////////////////////////////////////////////////////////////
		
		//
		//		// agrega restricciones a 'image view'
		//		// horizontales
		//		addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
		//		// y vertical
		//		addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
		
	}
	
	
} // end class
