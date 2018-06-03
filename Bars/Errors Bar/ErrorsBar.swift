//
//  ErrorsBar.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 26/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

//*****************************************************************
// MARK: - Errors Bar Class
//*****************************************************************

class ErrorsBar: UIView {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// MARK: Collection View ------------------------------------------
	lazy var collectionView: UICollectionView = { // notar como toda la configuración de la cv está encapsulada en este bloque
		
		// el flujo del diseño de la collection view
		let layout = UICollectionViewFlowLayout()
		// el constructor que inicializa la posición y el tamaño a 0
		
		let frame = CGRect(x: 0, y: 0, width: 400, height: 50)
		let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
		// pone el color de fondo de la cv a rojo
		cv.backgroundColor = .white
		
		// el objeto que le proporciona los datos a la cv
		cv.dataSource = self  // 🔌
		// el objeto que actúa como delegadon y gestiona las interacciones con la cv
		cv.delegate = self  // 👇
		
		// devuelve la vista de la colección ya configurada
		return cv // 🎁
	}()
	// ---------------------------------------------------------------
	
	// MARK: Collection View Cell ------------------------------------
	// el identificador de la celda de la cv
	let cellId = "cellId"
	
	// las imágenes de cada una de las celdas de la cv
	let failureImage = ["failure_image", "failure_image", "failure_image"]
	
	// ----------------------------------------------------------------
	
	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************
	
	// MARK: UIView
	
	// proceso de inicialización del objeto contenedor 'MenuBarContainer: UIView'
	// inicializa la vista que va a contener una 'collection view'
	// dibuja el rectángulo del marco de la vista
	override init(frame: CGRect) {
		
		super.init(frame: frame)

		
		// registra una celda personalizada con el identificador correspondiente
		collectionView.register(ErrorsBarCell.self, forCellWithReuseIdentifier: cellId)
		
		// agrega la vista de la 'collection view' dentro de la clase (recordar que es una sub-clase de 'UIView') 👈
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(collectionView)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder: has not been implemented")
	}
	
} // end class

//*****************************************************************
// MARK: - Methods (Data Source)
//*****************************************************************

// provee los datos a la colección
extension ErrorsBar: UICollectionViewDataSource {
	
	/// task: devolver la cantidad de items que tendrá la cv, en esta caso 4
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	/// task: devolver la celda personalizada reutilizable de la ´collection view´
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		// configurando la celda pesonalizada...

		// pone el index path, el identificador de las celdas y castea la celda a 'MenuBarCell'
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
		
		 //toma del array 'imageNames' las imágenes y las coloca sobre cada celda
//		cell.imageView.image = UIImage(named:failureImage[indexPath.item])
//		cell.imageView.image = UIImage(named: "failure_image")
		cell.backgroundColor = .black
		
//		// el color de fondo de la celda
//		cell.imageView.image = UIImage(named: "failure_image")
		
		// devuelve la celda ya configurada
		return cell
	}
}

//*****************************************************************
// MARK: - Methods (Layout)
//*****************************************************************

// gestiona el diseño de la colección
extension ErrorsBar: UICollectionViewDelegateFlowLayout {
	
	/// task: devolver el tamaño de cada celda
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		return CGSize(width: frame.width / 3, height: 50)
	}
	
	/// task: gestionar el espacio entre items
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
				return 1
			}
	
}

//*****************************************************************
// MARK: - Methods (View Interactions)
//*****************************************************************

extension ErrorsBar: UICollectionViewDelegate {}
