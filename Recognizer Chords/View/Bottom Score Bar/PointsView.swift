//
//  PointsView.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 29/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* View */

import UIKit

/* Abstract:
Una vista que representa la barra de puntos (aciertos) de la barra de scores.
*/

@IBDesignable
class PointsView: UIView {
	
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
	// el valor máximo de pasos es 8
	let maxValue: Double = 8
	
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
		
		// aplica la capa de fondo
		buildLayer(layer: backgroundLayer)
		backgroundLayer.strokeColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
		// aplica la capa de adelante
		buildLayer(layer: foregroundLayer)
		foregroundLayer.strokeColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).cgColor
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
	
	/// task: manejar el stepper
	@objc func handleStepper(_ stepper: UIStepper) {
		currentValue = stepper.value
	}
	
	//*****************************************************************
	// MARK: - Autolayout
	//***************************************************************
	
	/// task: aplicar restricciones a la barra de puntos
	func autolayout() {
		
		let pointsBarCenterX = self.centerXAnchor.constraint(equalTo: centerXAnchor)
		let pointsBarCenterY = self.centerYAnchor.constraint(equalTo: centerYAnchor)
		let pointsBarHeight = self.heightAnchor.constraint(equalToConstant: 40)
		NSLayoutConstraint.activate([pointsBarCenterX, pointsBarCenterY])
	}

} // end class


