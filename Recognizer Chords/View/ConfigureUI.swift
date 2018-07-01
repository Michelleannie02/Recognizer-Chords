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
	
	func setUserInterface() {
		
		// en principio el indicador de actividad (networking) está oculto
		activityIndicator.isHidden = true
		
		// en principio los botones de mayor y menor se encuentran deshabilitados
		majorButton.isEnabled = false
		minorButton.isEnabled = false

	}
	
	/// task: deshabilitar todos los botones o sólo los botones de acordes
	func disableButtons(all: Bool) {
		
		if all {
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			playButton.isEnabled = false
			
		} else {
			majorButton.isEnabled = false
			minorButton.isEnabled = false
		}
	}
	
	
	//*****************************************************************
	// MARK: - Animating
	//*****************************************************************
	
	func startAnimating() {
		activityIndicator.isHidden = false
		activityIndicator.startAnimating()
	}
	
	func stopAnimating() {
		activityIndicator.isHidden = true
		activityIndicator.stopAnimating()
	}
	
}

extension SecondScreenViewController {
		
	//*****************************************************************
	// MARK: - User Interface
	//*****************************************************************
		
	func setUserInterface() {
		
		// en principio el indicador de actividad (networking) está oculto
		activityIndicator.isHidden = true
		
		// en principio los botones de mayor y menor se encuentran deshabilitados
		majorButton.isEnabled = true
		minorButton.isEnabled = true
		diminishedButton.isEnabled = true
		augmentedButton.isEnabled = true
	}
	
	/// task: deshabilitar todos los botones o sólo los botones de acordes
	func disableButtons(all: Bool) {
		
		if all {
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
			playButton.isEnabled = false
			
		} else {
			
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
			
		}
	}
		
	//*****************************************************************
	// MARK: - Animating
	//*****************************************************************
		
	func startAnimating() {
		activityIndicator.isHidden = false
		activityIndicator.startAnimating()
	}
		
	func stopAnimating() {
		activityIndicator.isHidden = true
		activityIndicator.stopAnimating()
	}
	
	
} // end ext
