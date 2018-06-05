//
//  PruebaViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 26/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class PruebaViewController: UIViewController {
	
	
	@IBOutlet weak var button: UIButton!
	@IBOutlet weak var viewOne: UIView!
	@IBOutlet weak var backView: UIView!
	
	
	
	@IBAction func buttonPressed(_ sender: Any) {
		
		viewOne.isHidden = false
		backView.alpha = 0.5
		
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewOne.isHidden = true
		
	}
	
	
	
	
	

	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	
//	let vistaRoja : UIView = {
//		let rect = CGRect(x: 0, y: 0, width: 50, height: 50)
//		let v1 = UIView(frame: rect)
//		v1.backgroundColor = .red
//		return v1
//	}()
//
//
//	let vistaAmarilla : UIView = {
//		let rect = CGRect(x: 0, y: 300, width: 50, height: 50)
//		let v2 = UIView(frame: rect)
//		v2.backgroundColor = .yellow
//		return v2
//	}()
//
//	let vistaAzul : UIView = {
//		let rect = CGRect(x: 0, y: 600, width: 50, height: 50)
//		let v3 = UIView(frame: rect)
//		v3.backgroundColor = .blue
//		return v3
//	}()
	
	
	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
	


	
	//*****************************************************************
	// MARK: - Autolayout
	//*****************************************************************
	
	func autolayout() {
		
//		// heigth constraints
//		addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
		
		
//
//		// crea el stack view
//		let colorsStackView = UIStackView(arrangedSubviews: [vistaRoja, vistaAmarilla, vistaAzul])
//		colorsStackView.translatesAutoresizingMaskIntoConstraints = false
//		colorsStackView.axis = .horizontal
//		colorsStackView.distribution = .fillEqually
////		colorsStackView.setCustomSpacing(100, after: vistaRoja)
//
//		// lo agrega a la supervista
//		view.addSubview(colorsStackView)
//
//		// restricciones a 'colorsStackView'
//		NSLayoutConstraint.activate([
//			colorsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//			colorsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//			colorsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//			colorsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
//			]
//
//		)
		
//		vistaAzul.translatesAutoresizingMaskIntoConstraints = false
//
//		view.addSubview(vistaAzul)
//		view.addSubview(vistaRoja)
//		view.addSubview(vistaAmarilla)
//
//
//
//		NSLayoutConstraint.activate([
//			NSLayoutConstraint(item: vistaAzul, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 400)
//
//
//			])
		
		
//		vistaAzul.addConstraint(NSLayoutConstraint(item: vistaAzul, attribute: .height, relatedBy: .equal, toItem: vistaAzul, attribute: .height, multiplier: 0, constant: 200))

		
		
		

//		let topStackView = UIStackView(arrangedSubviews: [vistaUno, vistaDos])
//		topStackView.translatesAutoresizingMaskIntoConstraints = false
//		topStackView.axis = .vertical
//		topStackView.distribution = .fillEqually
//
//		view.addSubview(topStackView)
//
//				// restricciones a 'top stack view'
//				NSLayoutConstraint.activate([
//					// ancla 'topStackView' con el fondo de la supervista
//					topStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//					// ancla 'topStackView' con el lado izquierdo de la supervista
//					topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//					// ancla 'topStackView' con el lado derecho de la supervista
//					topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//					topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
//					])



	}

	

} // end class
