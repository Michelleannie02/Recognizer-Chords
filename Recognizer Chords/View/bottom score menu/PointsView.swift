//
//  PointsView.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 29/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

@IBDesignable
class PointsView: UIView {
	
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

//	let label = UILabel()
//
//	// stepper is 0 to 10
	let stepper = UIStepper()
	
	let step: Double = 100  // go up by $100 at a time
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
	
	
	var backgroundLayer = CAShapeLayer()
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
		buildInterface()
		layer.addSublayer(backgroundLayer)
		layer.addSublayer(foregroundLayer)
		foregroundLayer.strokeEnd = 0
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		buildLayer(layer: backgroundLayer)
		backgroundLayer.strokeColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor


		
		buildLayer(layer: foregroundLayer)
		foregroundLayer.strokeColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).cgColor
	}
	
	func buildLayer(layer: CAShapeLayer) {
		let path = UIBezierPath()

		// el dibujo de la línea se mueve desde x:20
		path.move(to: CGPoint(x: 20, y: 15))

//		path.addLine(to: CGPoint(x: bounds.width, y: bounds.height/3))
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
	
	func buildInterface() {
		
		let pointsBarCenterX = self.centerXAnchor.constraint(equalTo: centerXAnchor)
		let pointsBarCenterY = self.centerYAnchor.constraint(equalTo: centerYAnchor)
		NSLayoutConstraint.activate([pointsBarCenterX, pointsBarCenterY])

	}

} // end class


