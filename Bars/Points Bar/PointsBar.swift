//
//  PointsBar.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 26/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

/*
Budget View: una vista que consta de 3 sub-vistas:
-un arco
-una etiqueta
-un stepper
*/

@IBDesignable
class PointsBar: UIView {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// dos instancias que representan el fondo y el adelante del arco
	// azul para el fondo
	var backgroundLayer = ArcLayer(color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
	// celeste para la de adelante
	var foregroundLayer = ArcLayer(color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
	
	/// la etiqueta con el contador
	let label = UILabel()
	
	// stepper is 0 to 10
	let stepper = UIStepper()
	
	// cada vez que da un paso suma 100
	let step: Double = 100
	
	// el máximo de pasos es 4
	let maxValue:Double = 10
	
	// el valor actual de la etiqueta
	var currentValue: Double = 0 { // el valor de inicio es 0
		didSet {
			// cambia el valor actual cada vez que da un paso
			label.text = "\(Int(currentValue * step))"
			
			// la animación de la barra
			let animation = CABasicAnimation(keyPath: "strokeEnd")
			animation.duration = 1.0
			foregroundLayer.strokeEnd = CGFloat(currentValue/maxValue)
			foregroundLayer.add(animation, forKey: "stroke")
			
			//      foregroundLayer.strokeEnd = CGFloat(currentValue/maxValue)
		}
	}
	
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: actualizar el interface builder
	override func awakeFromNib() {
		super.awakeFromNib()
		setup()
	}
	
	/// task: actualizar los objetos diseñables del IB
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		setup()
	}
	
	/// task: configurar la interfaz
	func setup() {
		buildInterface()
		layer.addSublayer(backgroundLayer)
		layer.addSublayer(foregroundLayer)
		foregroundLayer.strokeEnd = 0
	}
	
	/// task: presentar subvistas
	override func layoutSubviews() {
		super.layoutSubviews()
		
		// asigna los límites de la capa del arco del fondo a la de la vista
		backgroundLayer.bounds = bounds
		// idem pero para la capa de adelante
		foregroundLayer.bounds = bounds
		
		
	}
	
	//  func buildLayer(layer: CAShapeLayer) {
	//    let path = UIBezierPath()
	//    path.move(to: CGPoint(x: 0, y: bounds.height/3))
	//    path.addLine(to: CGPoint(x: bounds.width, y: bounds.height/3))
	//    layer.path = path.cgPath
	//    layer.lineWidth = 20
	//    layer.fillColor = nil
	//    layer.lineCap = kCALineCapRound
	//  }
	
	
	/// task: construir la interfaz
	func buildInterface() {
		
		// Stepper ---------------------------------------
		// determina que el valor mínimo del stepper sea 0
		stepper.minimumValue = 0
		// determina que el valor máximo sea 4 (pasos)
		stepper.maximumValue = maxValue
		// para que el stepper pueda ser afectado por las restricciones
		stepper.translatesAutoresizingMaskIntoConstraints = false
		// cada vez que el valor del stepper cambia actualiza el valor actual (y por lo tanto se acciona una animación)
		stepper.addTarget(self, action: #selector(handleStepper(_:)), for: .valueChanged)
		// es estado contínuo del stepper
		stepper.isContinuous = true
		// agrega el stepper con una sub-vista de la vista
		addSubview(stepper)
		
		// las restricciones del stepper (autolayout)
		let stepCenterX = stepper.centerXAnchor.constraint(equalTo: centerXAnchor)
		let stepBottom = stepper.bottomAnchor.constraint(equalTo: bottomAnchor)
		NSLayoutConstraint.activate([stepCenterX, stepBottom])
		
		// Label --------------------------------------------
		// el valor inicial de la etiqueta
		label.text = "0"
		// su alineación
		label.textAlignment = .center
		// para que la etiqueta pueda ser afectado por las restricciones
		label.translatesAutoresizingMaskIntoConstraints = false
		// agrega la etiqueta como una sub-vista de la vista
		addSubview(label)
		
		// las restricciones de la etiqueta (autolayout)
		let labelCenterX = label.centerXAnchor.constraint(equalTo: centerXAnchor)
		let labelCenterY = label.centerYAnchor.constraint(equalTo: centerYAnchor)
		NSLayoutConstraint.activate([labelCenterX, labelCenterY])
	}
	
	/// task: manejar el stepper
	@objc func handleStepper(_ stepper: UIStepper) {
		// actualizar el valor actual al valor actual del stepper
		currentValue = stepper.value
	}
	
	
} // end class


//*****************************************************************
// MARK: - ArcLayer Class
//*****************************************************************

/// una sub-clase de 'CAShapeLayer' que represente la forma del arco
class ArcLayer: CAShapeLayer {
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	init(color:UIColor) {
		
		super.init()
		strokeColor = color.cgColor
		lineWidth = 10
		fillColor = nil
		lineCap = kCALineCapRound
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// empty init layer
	override init(layer: Any) {
		super.init(layer: layer)
	}
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	override var bounds: CGRect {
		
		didSet {
			
			buildLayer()
		}
	}
	
	
	/// task: construir la capa que contendrá el arco
	func buildLayer() {
		
		// el ángulo inicial
		let startAngle = 0.75 * CGFloat.pi
		// el ángulo final
		let endAngle = 0.25 * CGFloat.pi
		// el centro del arco
		let center = CGPoint(x:bounds.midX, y: bounds.midY)
		// el tamaño del radio del arco
		let radius = bounds.width * 0.35
		
		// el recorrido para dibujar el arco
		let path = UIBezierPath(arcCenter: center,
								radius: radius,
								startAngle: startAngle,
								endAngle: endAngle,
								clockwise: true)
		
		self.path = path.cgPath
		// la posición donde estará el arco
		position = CGPoint(x: bounds.midX, y: bounds.midY)
		
	}
	
	
} // end class


//class PointsBar: UIView {
//
//	//*****************************************************************
//	// MARK: - Properties
//	//*****************************************************************
//
//	// MARK: Collection View ------------------------------------------
//	lazy var collectionView: UICollectionView = { // notar como toda la configuración de la cv está encapsulada en este bloque
//
//		// el flujo del diseño de la collection view
//		let layout = UICollectionViewFlowLayout()
//		// el constructor que inicializa la posición y el tamaño a 0
//
//		let frame = CGRect(x: 0, y: 0, width: 400, height: 50)
//
//		let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
//
//		// la vista 'PointsBar' se vuelve delegado de los métodos ´data source´ de la cv
//		cv.dataSource = self  // 🔌
//		// la vista 'PointsBar' se vuelve delegado de los métodos ´delegate´ de la cv
//		cv.delegate = self  // 👇
//		cv.backgroundColor = .white
//
////		layout.scrollDirection = .horizontal
//
//		// devuelve la vista de la colección ya configurada
//		return cv
//	}()
//	// ---------------------------------------------------------------
//
//	// MARK: Collection View Cell ------------------------------------
//	// el identificador de la celda de la cv
//	let cellId = "cellId"
//
//	// las imágenes de cada una de las celdas de la cv
//	let imageNames = ["gClef_image", "settings_image", "lastScores_image", "headphones_image"]
//
//	// ----------------------------------------------------------------
//
//	//*****************************************************************
//	// MARK: - Initializers
//	//*****************************************************************
//
//	// MARK: UIView
//
//	// proceso de inicialización del objeto contenedor 'MenuBarContainer: UIView'
//	// inicializa la vista que va a contener una 'collection view'
//	// dibuja el rectángulo del marco de la vista
//	override init(frame: CGRect) {
//
//		super.init(frame: frame)
//
//
//		// registra una celda personalizada con el identificador correspondiente
//		collectionView.register(PointsBarCell.self, forCellWithReuseIdentifier: cellId)
//
//		// agrega la vista de la 'collection view' dentro de la clase (recordar que es una sub-clase de 'UIView') 👈
//		collectionView.translatesAutoresizingMaskIntoConstraints = false
//		addSubview(collectionView)
//
//	}
//
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder: has not been implemented")
//	}
//
//} // end class
//
////*****************************************************************
//// MARK: - Methods (Data Source)
////*****************************************************************
//
//// provee los datos a la colección
//extension PointsBar: UICollectionViewDataSource {
//
//	/// task: devolver la cantidad de items que tendrá la cv, en esta caso 4
//	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//		return 8
//	}
//
//	/// task: devolver la celda personalizada reutilizable de la ´collection view´
//	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//		// configurando la celda pesonalizada...
//
//		// pone el index path, el identificador de las celdas y castea la celda a 'MenuBarCell'
//		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
//
//		// toma del array 'imageNames' las imágenes y las coloca sobre cada celda
//		//			cell.imageViewCell.image = UIImage(named:imageNames[indexPath.item])
//
//		// el color de fondo de la celda
//		cell.backgroundColor = .gray
//		print("😂\(cell.backgroundColor)")
////		cell.imageView.image = UIImage(named: "failure_image")
//
//
//		// devuelve la celda ya configurada
//		return cell
//	}
//}
//
////*****************************************************************
//// MARK: - Methods (Layout)
////*****************************************************************
//
//// gestiona el diseño de la colección
//extension PointsBar: UICollectionViewDelegateFlowLayout {
//
//	/// task: devolver el tamaño de cada celda
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//		return CGSize(width: frame.width / 8, height: 50)
//	}
//
//			/// task: gestionar el espacio entre items
//			func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//				return 1
//			}
//
//}
//
////*****************************************************************
//// MARK: - Methods (View Interactions)
////*****************************************************************
//
//extension PointsBar: UICollectionViewDelegate {}
