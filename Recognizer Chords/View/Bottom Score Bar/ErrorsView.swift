//
//  ErrorsView.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 03/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* View */

import UIKit

/* Abstract:
Una vista que representa la barra de errores de la barra de scores.
*/

@IBDesignable
class ErrorsView: UIView {
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	override init(frame: CGRect) {
		
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// el stepper
	let stepper = UIStepper()
	// cada paso 'vale' 100
	let step: Double = 100
	// el valor máximo de pasos es 3
	let maxValue: Double = 3
	
	// el valor actual de la etiqueta es 0
	// cada vez que el stepper es tapeado este valor cambia y produce una animación
	var currentValue: Double = 0 {
		didSet {
			
			// entonces se produce una animación en la barra
			let animation = CABasicAnimation(keyPath: "strokeEnd")
			// que dura medio segundo
			animation.duration = 0.2
			
			foregroundLayer.strokeEnd = CGFloat(currentValue/maxValue)
			foregroundLayer.add(animation, forKey: "stroke")
		}
	}
	
	// la capa del fondo
	var backgroundLayer = CAShapeLayer()
	// la capa de adelante
	var foregroundLayer = CAShapeLayer()
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setup()
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		setup()
	}
	
	func setup() {
		autolayout()
		layer.addSublayer(backgroundLayer)
		layer.addSublayer(foregroundLayer)
		foregroundLayer.strokeEnd = 0
	}
	
	/// task: agregar subvistas a la vista
	override func layoutSubviews() {
		super.layoutSubviews()
		buildLayer(layer: backgroundLayer)
		backgroundLayer.strokeColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
		
		buildLayer(layer: foregroundLayer)
		foregroundLayer.strokeColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor
	}
	
	/// task: dibujar las capas
	func buildLayer(layer: CAShapeLayer) {
		
		// el dibujo
		let path = UIBezierPath()
		
		// el dibujo de la línea se mueve desde x:20, y: 15
		path.move(to: CGPoint(x: 20, y: 15))
		path.addLine(to: CGPoint(x: bounds.width/1.1, y: 15))
		
		// agrega el dibujo a la capa
		layer.path = path.cgPath
		layer.lineWidth = 20
		layer.fillColor = nil
		layer.lineCap = kCALineCapRound
	}
	
	
	// MARK:- Subviews
	
	@objc func handleStepper(_ stepper: UIStepper) {
		currentValue = stepper.value
	}
	
	/// task: aplicar restricciones a la barra de puntos
	func autolayout() {

		let errorsBarCenterX = self.centerXAnchor.constraint(equalTo: centerXAnchor)
		let errrosBarCenterY = self.centerYAnchor.constraint(equalTo: centerYAnchor)
		let errorsBarHeight = self.heightAnchor.constraint(equalToConstant: 50)
		NSLayoutConstraint.activate([errorsBarCenterX, errrosBarCenterY])
		
	}
	
} // end class
