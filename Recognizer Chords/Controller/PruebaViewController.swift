//
//  PruebaViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 26/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class PruebaViewController: UIViewController {
	
	@IBOutlet weak var vistaUno: UIView!
	@IBOutlet weak var vistaDos: UIView!
	
	
//	let vista1 : UIView = {
//		let rect = CGRect(x: 0, y: 0, width: 0, height: 0)
//		let v1 = UIView(frame: rect)
//		v1.backgroundColor = .red
//		return v1
//	}()
//
//
//	let vista2 : UIView = {
//		let rect = CGRect(x: 0, y: 0, width: 0, height: 100)
//		let v2 = UIView(frame: rect)
//		v2.backgroundColor = .blue
//		return v2
//	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		
		//autolayout()
		
    }

	func autolayout() {

		let topStackView = UIStackView(arrangedSubviews: [vistaUno, vistaDos])
		topStackView.translatesAutoresizingMaskIntoConstraints = false
		topStackView.axis = .vertical
		topStackView.distribution = .fillEqually

		view.addSubview(topStackView)

				// restricciones a 'top stack view'
				NSLayoutConstraint.activate([
					// ancla 'topStackView' con el fondo de la supervista
					topStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
					// ancla 'topStackView' con el lado izquierdo de la supervista
					topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
					// ancla 'topStackView' con el lado derecho de la supervista
					topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
					topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
					])



	}

	

} // end class
