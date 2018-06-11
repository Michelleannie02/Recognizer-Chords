//
//  PointsBarView
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 02/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//


import UIKit

//@IBDesignable
class PointsBarView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .red
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************

	
	// un controlador para incrementar o decrementar un valor
	let stepper = UIStepper()
	
	// cada paso del stepper imprime 1 en la etiqueta
	let step: Double = 1
	
	// el valor máximo del stepper es 8
	let maxValue:Double = 8
	
	// el valor actual de la etiqueta es 0
	// cada vez que el stepper es tapeado este valor cambia y produce una animación
	var currentValue: Double = 0 {
		didSet {
			
			// entonces se produce una animación en la barra
			let animation = CABasicAnimation(keyPath: "strokeEnd")
			// que dura medio segundo
			animation.duration = 0.5
			
			foregroundLayer.strokeEnd = CGFloat(currentValue/maxValue)
			foregroundLayer.add(animation, forKey: "stroke")
		}
	}
	
	// CAShapeLayer: Una capa que dibuja una spline de Bezier cúbica en su espacio de coordenadas.
	/// una capa con el dibujo del segmento (fondo)
	var backgroundLayer = SegmentLayer(color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
	/// una capa con el dibujo del segmento (frente)
	var foregroundLayer = SegmentLayer(color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
	
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: actualizar el IB
	override func awakeFromNib() {
		super.awakeFromNib()
		setup()
	}

	/// task: se invoca cuando se crea un objeto diseñado en el Interface Builder.
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		setup()
	}
	
	/// task: configurar la interfaz de usuario
	func setup() {
		// construye la UI
		buildInterface()
		// agrega a la capa de la vista una sub-capa con un dibujo
		layer.addSublayer(backgroundLayer)
		// agrega a la capa de la vista una sub-capa con un dibujo
		layer.addSublayer(foregroundLayer)
		// pone el trazo de la capa 'foregroundLayer' a 0. Es decir, en principio del dibujo no aparece.
		foregroundLayer.strokeEnd = 0
	}
	
	/// task: gestionar el diseño de las sub-vistas para que estén disponibles para ser animadas
	override func layoutSubviews() {
		super.layoutSubviews()
		// pone la límites de esta capa con los límites de su vista
		backgroundLayer.bounds = bounds
		foregroundLayer.bounds = bounds
	}
	
	/// task: construir la UI
	func buildInterface() {
		// pone al valor del stepper a 0
		stepper.minimumValue = 0
		// pone al valor máximo del stepper a 4
		stepper.maximumValue = maxValue
		// hace que el stepper sea susceptible a autolayout
		stepper.translatesAutoresizingMaskIntoConstraints = false
		// si el valor del stepper cambia, se ejecuta un método para actualizar su estado 👈
		stepper.addTarget(self, action: #selector(handleStepper(_:)), for: .valueChanged)
		// hace que el stepper sea contínuo
		stepper.isContinuous = true
		// agrega a la vista la sub-vista del stepper
		addSubview(stepper)
		
//		// stepper autolayout 
//		let stepCenterX = stepper.centerXAnchor.constraint(equalTo: centerXAnchor)
//		let stepBottom = stepper.bottomAnchor.constraint(equalTo: bottomAnchor)
//		// activa la restricciones
//		NSLayoutConstraint.activate([stepCenterX, stepBottom])
		
	}
	

	//*****************************************************************
	// MARK: - Actions
	//*****************************************************************
	
	/// task: manejar el estado del stepper
	@objc func handleStepper(_ stepper: UIStepper) {
		// actualiza el valor del stepper
		currentValue = stepper.value
	}
	

} // end class


//*****************************************************************
// MARK: - Arc Layer Class
//*****************************************************************

/// el dibujo del segmento en la capa
class SegmentLayer: CAShapeLayer {
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	/// task: construir el objeto 'Segment Layer'
	init(color: UIColor) {
		super.init()
		// el color el dibujo
		strokeColor = color.cgColor
		// el ancho de la línea
		lineWidth = 10
		// el color del relleno de la línea
		fillColor = nil
		// la forma redondeada de los finales de la línea
		lineCap = kCALineCapRound
	}
	
	override init(layer: Any) {
		super.init(layer: layer)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	override var bounds: CGRect {
		didSet {
			buildLayer()
		}
	}

	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: dibujar la que contendrá la capa
	func buildLayer() {
		
		// el recorrido del dibujo
		let path = UIBezierPath()
		path.move(to: CGPoint(x: 5, y: 5))
		path.addLine(to: CGPoint(x: 130, y: 5))
		// le agrega el recorrido trazado (el dibujo) a la capa
		self.path = path.cgPath
		// posiciona el dibujo en el centro de sus límites
		position = CGPoint(x: bounds.midX, y: bounds.midY)
	}
	
} // end class





















