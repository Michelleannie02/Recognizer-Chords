//
//  BaseCell.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 08/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* View */

import UIKit

/* Abstract:
Una celda base a la cual 'apuntarán' diversas celdas.
*/

class BaseCell: UICollectionViewCell {

	/// task:  inicializa la celda definiendo su marco
	override init(frame: CGRect) {
		super.init(frame: frame)

		// configura las vistas
		setupViews()

	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************

	func setupViews() {}


} // end class
