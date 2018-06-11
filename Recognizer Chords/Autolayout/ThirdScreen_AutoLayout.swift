//
//  ThirdScreen_Autolayout.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 09/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

/* Abstract:
Aplica restricciones a los elementos gráficos de la tercer pantalla.
*/

extension ThirdScreenViewController {
	
	
	//*****************************************************************
	// MARK: - Autolayout
	//*****************************************************************
	
	func autolayout() {
		
		// !!!! 👏
		majorButton.translatesAutoresizingMaskIntoConstraints = false
		minorButton.translatesAutoresizingMaskIntoConstraints = false
		minorSevenButton.translatesAutoresizingMaskIntoConstraints = false
		minorSevenMajorButton.translatesAutoresizingMaskIntoConstraints = false
		majorSevenButton.translatesAutoresizingMaskIntoConstraints = false
		majorSevenMinorButton.translatesAutoresizingMaskIntoConstraints = false
		playButton.translatesAutoresizingMaskIntoConstraints = false
		diminishedButton.translatesAutoresizingMaskIntoConstraints = false
		augmentedButton.translatesAutoresizingMaskIntoConstraints = false
		
		
		// NEXT TODO: poner los botones creados dentro de stacks views
		
		
		// MARK: - Stack Views
		
		/////////////////////////
		/// Center Stack View ///
		/////////////////////////
		
		// declara los tres stack views del centro
		let topCenterStackView = UIStackView(arrangedSubviews: [topLeftBackground, topRightBackground])
		let bottomCenterStackView = UIStackView(arrangedSubviews: [bottomLeftBackground, bottomRightBackground])
		let centerStackView = UIStackView(arrangedSubviews: [topCenterStackView, bottomCenterStackView])
		
		// center
		centerStackView.translatesAutoresizingMaskIntoConstraints = false
		centerStackView.axis = .vertical
		centerStackView.distribution = .fillEqually
		
		view.addSubview(centerStackView)
		
		// restricciones a 'center stack view'
		NSLayoutConstraint.activate([
			// ancla 'topStackView' con el tope de la supervista
			centerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			// ancla 'topStackView' con el lado izquierdo de la supervista
			centerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			// ancla 'topStackView' con el lado derecho de la supervista
			centerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			// ancla 'topStackView' con el fondo de la supervista
			centerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
			])
		
		// (top-center)
		topCenterStackView.translatesAutoresizingMaskIntoConstraints = false
		topCenterStackView.axis = .horizontal
		topCenterStackView.distribution = .fillEqually
		
		view.addSubview(topCenterStackView)
		
		// restricciones a 'top center stack view'
		NSLayoutConstraint.activate([
			// ancla 'topStackView' con el tope de la supervista
			topCenterStackView.topAnchor.constraint(equalTo:centerStackView.topAnchor),
			// ancla 'topStackView' con el lado izquierdo de la supervista
			topCenterStackView.leadingAnchor.constraint(equalTo: centerStackView.leadingAnchor),
			// ancla 'topStackView' con el lado derecho de la supervista
			topCenterStackView.trailingAnchor.constraint(equalTo: centerStackView.trailingAnchor),
			// ancla 'topStackView' con el fondo de la supervista
			topCenterStackView.bottomAnchor.constraint(equalTo: view.centerYAnchor)
			])
		
		// (bottom-center)
		bottomCenterStackView.translatesAutoresizingMaskIntoConstraints = false
		bottomCenterStackView.axis = .horizontal
		bottomCenterStackView.distribution = .fillEqually
		
		view.addSubview(bottomCenterStackView)
		
		// restricciones a 'top center stack view'
		NSLayoutConstraint.activate([
			// ancla 'topStackView' con el tope de la supervista
			bottomCenterStackView.topAnchor.constraint(equalTo: view.centerYAnchor),
			// ancla 'topStackView' con el lado izquierdo de la supervista
			bottomCenterStackView.leadingAnchor.constraint(equalTo: centerStackView.leadingAnchor),
			// ancla 'topStackView' con el lado derecho de la supervista
			bottomCenterStackView.trailingAnchor.constraint(equalTo: centerStackView.trailingAnchor),
			// ancla 'topStackView' con el fondo de la supervista
			bottomCenterStackView.bottomAnchor.constraint(equalTo: centerStackView.bottomAnchor)
			])
		
		
		///////////////////
		/// Play Button ///
		///////////////////
		
		view.addSubview(playButton)
		NSLayoutConstraint.activate([
			// ancla 'play button' en el centro de la pantalla
			playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
			])
		
		
		//////////////////////
		/// Top Stack View ///
		//////////////////////
		
		let topStackView = UIStackView(arrangedSubviews: [gClefButton, settingsButton, lastScoresButton, headphonesButton])
		topStackView.translatesAutoresizingMaskIntoConstraints = false
		topStackView.axis = .horizontal
		topStackView.distribution = .fillEqually
		
		view.addSubview(topStackView)
		
		// restricciones a 'top stack view'
		NSLayoutConstraint.activate([
			// ancla 'topStackView' con el tope de la supervista
			topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			// ancla 'topStackView' con el lado izquierdo de la supervista
			topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			// ancla 'topStackView' con el lado derecho de la supervista
			topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			// ancla 'topStackView' con el fondo de la supervista
			topStackView.heightAnchor.constraint(equalToConstant: 100)
			])
	}
	
} // end class

