//
//  TwoChordsContainer.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 04/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* View */

import UIKit

/* Abstract:
Esta clase representa una vista que contiene información acerca de los dos acordes que incluye esta pantalla.
*/

class TwoChordsContainer: UICollectionView {

	// 6 vistas:
	// chordCell: UICollectionViewCell
	// majorLabel: UILabel ✓
	// majorNotation: UIImageView ✓
	// minorLabel: UILabel ✓
	// moinorNotation: UIImageView ✓
	// chordsSeparator: UIImage ✓
	
	/// una etiqueta con la inicial del acorde Mayor
	let majorLabel: UILabel = {
		
		// el tamaño de la etiqueta
		let frameLabel = CGRect(x: 0, y: 0, width: 50, height: 50)
		// inicializa la etiqueta con el tamaño especificado
		let ml = UILabel(frame: frameLabel)
		// pone rojo al color de fondo
		ml.backgroundColor = .red
		// define el tipo de fuente y su tamaño
		ml.font = UIFont.boldSystemFont(ofSize: 14)

		// devuelve la etiqueta ya configurada
		return ml
		
	}()
	
	/// una imágen con la notación de un acorde mayor
	let majorNotation: UIImageView = {
		
		let majorNatationRect = CGRect(x: 0, y: 0, width: 50, height: 50)
		let mn = UIImageView(frame: majorNatationRect)
		mn.image = UIImage(named: "failure_image")
		
		
		return mn
	}()
	
	/// una etiqueta con la inicial del acorde menor
	let minorLabel: UILabel = {
		
		// el tamaño de la etiqueta
		let frameLabel = CGRect(x: 0, y: 0, width: 50, height: 50)
		// inicializa la etiqueta con el tamaño especificado
		let ml = UILabel(frame: frameLabel)
		// pone rojo al color de fondo
		ml.backgroundColor = .red
		// define el tipo de fuente y su tamaño
		ml.font = UIFont.boldSystemFont(ofSize: 14)
		
		// devuelve la etiqueta ya configurada
		return ml
		
	}()
	
	/// una imágen con la notación de un acorde menor
	let minorNotation: UIImageView = {
		
		let majorNatationRect = CGRect(x: 0, y: 0, width: 50, height: 50)
		let mn = UIImageView(frame: majorNatationRect)
		mn.image = UIImage(named: "failure_image")
		
		
		return mn
	}()
	

	/// un separador entre las celdas
	let separatorView: UIView = {
		
		// crea una vista
		let view = UIView()
		
		// le pone un gris como color de fondo
		view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
		
		//  y devuelve la vista
		return view
	}()
	
	
} // end class

