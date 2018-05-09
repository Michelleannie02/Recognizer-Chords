//
//  MenuBarContainer.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 04/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* View */

import UIKit

/* Abstract:
Esta clase representa una barra de menú.
*/

//*****************************************************************
// MARK: - Menu Bar Class
//*****************************************************************

class MenuBarContainer: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

	//*****************************************************************
	// MARK: - Initializers
	//*****************************************************************

	// inicializa la vista que va a contener una 'collection view'
	override init(frame: CGRect) {
		super.init(frame: frame)

		// registra una celda personalizada con el identificador correspondiente
		collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: cellId)

		// agrega la vista de la 'collection view' 👈
		addSubview(collectionView)
		
		// collectionView AUTOLAYOUT 📌 ///////////////////////////////////
		
		// le agrega restricciones horizontales
		addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
		// y verticales
		addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
		
		//////////////////////////////////////////////////////////////////

	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder: has not been implemented")
	}

	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************

	// la 'collection view'
	lazy var collectionView: UICollectionView = {

		// 'collection view flow layout':
		// Un objeto de diseño concreto que organiza elementos en una cuadrícula con vistas opcionales de encabezado y pie de página para cada sección.
		let layout = UICollectionViewFlowLayout()
		// ahora la construye
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		// pone el color de fondo de la 'collection view'
		cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)


		// la clase 'MenuBar' se convierte en el delegado de los métodos
		// que les proveen los protocolos de la clase 'UICollectionView'
		cv.dataSource = self
		cv.delegate = self

		// devuelve la 'collection view' ya configurada
		return cv
	}()

	// el identificador de las celdas
	let cellId = "cellId"


	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************

	/// task: devolver la cantidad de items que tendrá la sección
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}

	/// task: devolver la celda personalizada reutilizable de la ´collection view´
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		// configurando la celda pesonalizada...
		
		// pone el index path, el identificador de las celdas y castea la celda a 'MenuBarCell'
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell

		// devuelve la celda ya configurada
		return cell
	}

	/// task: devolver el tamaño del item
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		return CGSize(width: frame.width / 4, height: frame.height)
	}
	
	/// task: devolver el espacio mínimo (medido en puntos) para aplicar entre elementos suecesivos en las líneas de una sección
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

} // end class










