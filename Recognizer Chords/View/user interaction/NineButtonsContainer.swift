//
//  NineButtonsContainer.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 04/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* View */

import UIKit

/* Abstract:
Esta clase representa una interfaz que contiene nueve botones:
1- botón de play
2- botón de acorde mayor
3- botón de acorde menor
4- botón de acorde disminuído
5- botón de acorde aumentado
6- botón de acorde mayor con séptima mayor
7- botón de acorde mayor con séptima menor
8- botón de acorde menor con séptima mayor
9- botón de acorde mayor con séptima menor
*/

class NineButtonsContainer: UIStackView { // un contenedor para los nueve botones
	
	//*****************************************************************
	// MARK: - Properties (Views)
	//*****************************************************************
	
//	/// un botón con la leyenda ´previo´
//	let previousButton: UIButton = {
//		let button = UIButton(type: .system)
//		button.setTitle("PREV", for: .normal)
//		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//		button.setTitleColor(.gray, for: .normal)
//		// action!
//		button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
//		button.translatesAutoresizingMaskIntoConstraints = false
//		return button
//	}()
	
	
	/// un botón de un acorde mayor
	let majorButton: UIButton = {
		
		let mb = UIButton(type: .system)
		mb.setTitle("Major", for: .normal)
		
		mb.translatesAutoresizingMaskIntoConstraints = false
		
		return mb
	}()
	

	/// un botón de un acorde menor
	let minorButton: UIButton = {
		
		let mb = UIButton(type: .system)
		mb.setTitle("Minor", for: .normal)
		
		return mb
	}()
	
	/// un botón de un acorde disminuído
	let disminishedButton: UIButton = {
		
		let db = UIButton(type: .system)
		db.setTitle("Diminished", for: .normal)
		
		return db
	}()
	
	/// un botón de un acorde aumentado
	let augmentedButton: UIButton = {
		
		let ab = UIButton(type: .system)
		ab.setTitle("Augmented", for: .normal)
		
		return ab
	}()
	
	/// un botón de un acorde mayor con séptima mayor
	let major7MButton: UIButton = {
		
		let m7M = UIButton(type: .system)
		m7M.setTitle("Augmented", for: .normal)
		
		return m7M
	}()
	
	/// un botón de un acorde mayor con séptima menor
	let major7mButton: UIButton = {
		
		let m7m = UIButton(type: .system)
		m7m.setTitle("Augmented", for: .normal)
		
		return m7m
	}()
	
	/// un botón de un acorde menor con séptima menor
	let minor7mButton: UIButton = {
		
		let m7m = UIButton(type: .system)
		m7m.setTitle("Augmented", for: .normal)
		
		return m7m
	}()
	
	/// un botón de un acorde menor con séptima mayor
	let minor7MButton: UIButton = {
		
		let m7M = UIButton(type: .system)
		m7M.setTitle("Augmented", for: .normal)
		
		return m7M
	}()
	
	/// un botón de play
	let playButton: UIButton = {
		
		let pb = UIButton(type: .system)
		pb.setTitle("Play", for: .normal)
		
		return pb
	}()
	
} // end class
