//
//  FourChordsContainer.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 09/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* View */

import UIKit

/* Abstract:
Esta clase representa una vista que contiene información acerca de los cuatro acordes que incluye esta pantalla.
*/

class FourChordsContainer: UICollectionView {
	
	// 10 vistas:
	// chordCell: UICollectionViewCell
	// majorLabel: UILabel ✓
	// majorNotation: UIImageView ✓
	// minorLabel: UILabel ✓
	// moinorNotation: UIImageView ✓
	// diminishedLabel: UILabel ✓
	// diminishedNotation: UIImageView ✓
	// augmentedLabel: UILabel ✓
	// augmentedNotation: UIImageView ✓
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
	
	/// una imágen con la notación de un acorde Mayor
	let majorNotation: UIImageView = {
		
		let majorNatationRect = CGRect(x: 0, y: 0, width: 50, height: 50)
		let mn = UIImageView(frame: majorNatationRect)
		mn.image = UIImage(named: "failure_image")
		
		
		return mn
	}()
	
	/// una etiqueta con la inicial del acorde Menor
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
	
	/// una imágen con la notación de un acorde Menor
	let minorNotation: UIImageView = {
		
		let majorNatationRect = CGRect(x: 0, y: 0, width: 50, height: 50)
		let mn = UIImageView(frame: majorNatationRect)
		mn.image = UIImage(named: "failure_image")
		
		
		return mn
	}()
	
	/// una etiqueta con la inicial del acorde Aumentado
	let augmentedLabel: UILabel = {
		
		// el tamaño de la etiqueta
		let frameLabel = CGRect(x: 0, y: 0, width: 50, height: 50)
		// inicializa la etiqueta con el tamaño especificado
		let al = UILabel(frame: frameLabel)
		// pone rojo al color de fondo
		al.backgroundColor = .red
		// define el tipo de fuente y su tamaño
		al.font = UIFont.boldSystemFont(ofSize: 14)
		
		// devuelve la etiqueta ya configurada
		return al
		
	}()
	
	/// una imágen con la notación de un acorde Aumentado
//	let aumentedNotation: UIImageView = {
//		
//		let aumentedNotationRect = CGRect(x: 0, y: 0, width: 50, height: 50)
//		let an = UIImageView(frame: majorNatationRect)
//		an.image = UIImage(named: "failure_image")
//		
//		
//		return an
//	}()
	
	/// una etiqueta con la inicial del acorde Disminuído
	let diminishedLabel: UILabel = {
		
		// el tamaño de la etiqueta
		let frameLabel = CGRect(x: 0, y: 0, width: 50, height: 50)
		// inicializa la etiqueta con el tamaño especificado
		let dl = UILabel(frame: frameLabel)
		// pone rojo al color de fondo
		dl.backgroundColor = .red
		// define el tipo de fuente y su tamaño
		dl.font = UIFont.boldSystemFont(ofSize: 14)
		
		// devuelve la etiqueta ya configurada
		return dl
		
	}()
	
	/// una imágen con la notación de un acorde Disminuído
	let diminishedNotation: UIImageView = {
		
		let majorNatationRect = CGRect(x: 0, y: 0, width: 50, height: 50)
		let dn = UIImageView(frame: majorNatationRect)
		dn.image = UIImage(named: "failure_image")
		
		
		return dn
	}()
	
	/// un separador entre las celdas
	let separatorView: UIView = {
		
		// crea una vista
		let sv = UIView()
		
		// le pone un gris como color de fondo
		sv.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
		
		//  y devuelve la vista
		return sv
	}()
	
	
} // end class
