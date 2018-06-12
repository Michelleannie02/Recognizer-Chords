//
//  ConfigureUI.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 11/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* View */

import UIKit

/*
Abstract:
Almacena todas las configuraciones de interfaz de usuario referentes a momentos de transición.
La interfaz de usuario queda inhabilitada y un 'activity indicator' se anima indicandole al usuario que debe esperar hasta que el proceso actual finalice. Cuando finaliza el proceso la interfaz vuelve a habilitarse y el 'activity indicator' desaparece.
*/


// MARK: - FirstScreenViewController (Configure UI)

extension FirstScreenViewController {
	
	//*****************************************************************
	// MARK: - User Interface
	//*****************************************************************
	
	func setUIEnabled(_ enabled: Bool) {
//		usernameTextField.isEnabled = enabled
//		passwordTextField.isEnabled = enabled
//		loginButton.isEnabled = enabled
		
//		// adjust login button alpha
//		if enabled {
//			loginButton.alpha = 1.0
//		} else {
//			loginButton.alpha = 0.5
//		}
	}
	
	//*****************************************************************
	// MARK: - Animating
	//*****************************************************************
	
	func startAnimating() {
		
		activityIndicator.isHidden = false
		activityIndicator.startAnimating()
		self.view.alpha = 0.75
	}
	
	func stopAnimating() {
		
		activityIndicator.isHidden = true
		activityIndicator.stopAnimating()
		self.view.alpha = 1.0
	}
	
}

extension SecondScreenViewController {
		
	//*****************************************************************
	// MARK: - User Interface
	//*****************************************************************
		
	func setUIEnabled(_ enabled: Bool) {
		
		//		usernameTextField.isEnabled = enabled
		//		passwordTextField.isEnabled = enabled
		//		loginButton.isEnabled = enabled
//
//		// adjust login button alpha
//		if enabled {
//			loginButton.alpha = 1.0
//		} else {
//			loginButton.alpha = 0.5
//		}
	
	}
		
	//*****************************************************************
	// MARK: - Animating
	//*****************************************************************
		
	func startAnimating() {
			
		activityIndicator.isHidden = false
		activityIndicator.startAnimating()
		self.view.alpha = 0.75
	}
		
	func stopAnimating() {
		
		activityIndicator.isHidden = true
		activityIndicator.stopAnimating()
		self.view.alpha = 1.0
	}
	
	
} // end ext
