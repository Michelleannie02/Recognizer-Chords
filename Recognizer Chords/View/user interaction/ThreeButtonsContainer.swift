//
//  ThreeButtonsContainer.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 04/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* View */

import UIKit

/* Abstract:
Esta clase representa una interfaz que contiene tres botones:
1- botón de play
2- botón de acorde mayor
3- botón de acorde menor
*/

class ThreeButtonsContainer: UIStackView { // un contenedor para los tres botones
	
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

		/// un botón de play
		let playButton: UIButton = {

			let pb = UIButton(type: .system)
			pb.setTitle("Play", for: .normal)
			
			pb.translatesAutoresizingMaskIntoConstraints = false

			return pb
		}()
	
} // end class


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
