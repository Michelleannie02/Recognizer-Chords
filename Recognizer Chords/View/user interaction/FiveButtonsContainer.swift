//
//  FiveButtonsContainer.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 04/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//


/* View */

import UIKit

/* Abstract:
Esta clase representa una interfaz que contiene cinco botones:
1- botón de play
2- botón de acorde mayor
3- botón de acorde menor
4- botón de acorde disminuído
5- botón de acorde aumentado
*/

class FiveButtonsContainer: UIStackView { // un contenedor para los cinco botones
	
	//*****************************************************************
	// MARK: - Properties (Views)
	//*****************************************************************
	
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
		
		mb.translatesAutoresizingMaskIntoConstraints = false
		
		return mb
	}()
	
	/// un botón de un acorde disminuído
	let disminishedButton: UIButton = {
		
		let db = UIButton(type: .system)
		db.setTitle("Diminished", for: .normal)
		
		db.translatesAutoresizingMaskIntoConstraints = false
		
		return db
	}()
	
	/// un botón de un acorde aumentado
	let augmentedButton: UIButton = {
		
		let ab = UIButton(type: .system)
		ab.setTitle("Augmented", for: .normal)
		
		ab.translatesAutoresizingMaskIntoConstraints = false
		
		return ab
	}()

	/// un botón de play
	let playButton: UIButton = {
		
		let pb = UIButton(type: .system)
		pb.setTitle("Play", for: .normal)
		
		pb.translatesAutoresizingMaskIntoConstraints = false
		
		return pb
	}()
	
} // end class

