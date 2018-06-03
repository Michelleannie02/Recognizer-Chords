//
//  PointsBar.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 26/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit


class PointsBar: UIView {

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

		// la vista 'PointsBar' se vuelve delegado de los métodos ´data source´ de la cv
		cv.dataSource = self  // 🔌
		// la vista 'PointsBar' se vuelve delegado de los métodos ´delegate´ de la cv
		cv.delegate = self  // 👇
		cv.backgroundColor = .white

//		layout.scrollDirection = .horizontal

		// devuelve la vista de la colección ya configurada
		return cv
	}()
	// ---------------------------------------------------------------

	// MARK: Collection View Cell ------------------------------------
	// el identificador de la celda de la cv
	let cellId = "cellId"

	// las imágenes de cada una de las celdas de la cv
	let imageNames = ["gClef_image", "settings_image", "lastScores_image", "headphones_image"]

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
		collectionView.register(PointsBarCell.self, forCellWithReuseIdentifier: cellId)

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
extension PointsBar: UICollectionViewDataSource {

	/// task: devolver la cantidad de items que tendrá la cv, en esta caso 4
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return 8
	}

	/// task: devolver la celda personalizada reutilizable de la ´collection view´
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		// configurando la celda pesonalizada...

		// pone el index path, el identificador de las celdas y castea la celda a 'MenuBarCell'
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)

		// toma del array 'imageNames' las imágenes y las coloca sobre cada celda
		//			cell.imageViewCell.image = UIImage(named:imageNames[indexPath.item])

		// el color de fondo de la celda
		cell.backgroundColor = .gray
		print("😂\(cell.backgroundColor)")
//		cell.imageView.image = UIImage(named: "failure_image")


		// devuelve la celda ya configurada
		return cell
	}
}

//*****************************************************************
// MARK: - Methods (Layout)
//*****************************************************************

// gestiona el diseño de la colección
extension PointsBar: UICollectionViewDelegateFlowLayout {

	/// task: devolver el tamaño de cada celda
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return CGSize(width: frame.width / 8, height: 50)
	}

			/// task: gestionar el espacio entre items
			func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
				return 1
			}

}

//*****************************************************************
// MARK: - Methods (View Interactions)
//*****************************************************************

extension PointsBar: UICollectionViewDelegate {}
