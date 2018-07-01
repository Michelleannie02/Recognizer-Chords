//
//  SecondScreen_Autolayout.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 09/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

/* Abstract:
Aplica restricciones a los elementos gráficos de la segunda pantalla.
*/

extension SecondScreenViewController {
	
	//*****************************************************************
	// MARK: - Autolayout
	//*****************************************************************
	
	func autolayout () {
		
		// translate autoresizing mask into constraints
		
		chordsInfoButton.translatesAutoresizingMaskIntoConstraints = false
		lastScoresButton.translatesAutoresizingMaskIntoConstraints =  false
		
		majorButton.translatesAutoresizingMaskIntoConstraints = false
		minorButton.translatesAutoresizingMaskIntoConstraints = false
		diminishedButton.translatesAutoresizingMaskIntoConstraints = false
		augmentedButton.translatesAutoresizingMaskIntoConstraints = false
		
		playButton.translatesAutoresizingMaskIntoConstraints = false
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		
		pointsBarView.translatesAutoresizingMaskIntoConstraints = false
		errorsBarView.translatesAutoresizingMaskIntoConstraints = false

		// definiendo los stack views

		// CENTER
		
		// center-top
		let centerTopStackView = UIStackView(arrangedSubviews: [majorButton, diminishedButton])
		
		// center-bottom
		let centerBottomStackView = UIStackView(arrangedSubviews: [augmentedButton, minorButton])
		
		// center
		let centerStackView = UIStackView(arrangedSubviews: [centerTopStackView, centerBottomStackView])
		
		// BOTTOM
		let bottomStackView = UIStackView(arrangedSubviews: [pointsBarView, errorsBarView])
		
		// TOP
		let topStackView = UIStackView(arrangedSubviews: [chordsInfoButton, lastScoresButton])
		
		
		/////////////////////////
		/// Center Stack View ///
		/////////////////////////
		
		// MARK: - center stack view
		
		/// center (root)
		centerStackView.translatesAutoresizingMaskIntoConstraints = false
		centerStackView.axis = .vertical
		centerStackView.distribution = .fillEqually
		
		view.addSubview(centerStackView)
		
		// restricciones a 'center stack view'
		NSLayoutConstraint.activate([
			// ancla 'topStackView' con el tope de la supervista
			centerStackView.topAnchor.constraint(equalTo: view.topAnchor),
			// ancla 'topStackView' con el lado izquierdo de la supervista
			centerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			// ancla 'topStackView' con el lado derecho de la supervista
			centerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			// ancla 'topStackView' con el fondo de la supervista
			centerStackView.bottomAnchor.constraint(equalTo: centerStackView.topAnchor)
			])
		
		
		/// (center-top)
		centerTopStackView.translatesAutoresizingMaskIntoConstraints = false
		centerTopStackView.axis = .horizontal
		centerTopStackView.distribution = .fillEqually
		
		view.addSubview(centerTopStackView)
		
		// restricciones a 'top center stack view'
		NSLayoutConstraint.activate([
			// ancla 'topStackView' con el tope de la supervista
			centerTopStackView.topAnchor.constraint(equalTo:centerStackView.topAnchor),
			// ancla 'topStackView' con el lado izquierdo de la supervista
			centerTopStackView.leadingAnchor.constraint(equalTo: centerStackView.leadingAnchor),
			// ancla 'topStackView' con el lado derecho de la supervista
			centerTopStackView.trailingAnchor.constraint(equalTo: centerStackView.trailingAnchor),
			// ancla 'topStackView' con el fondo de la supervista
			centerTopStackView.bottomAnchor.constraint(equalTo: view.centerYAnchor)
			])
		
		/// (center-bottom)
		centerBottomStackView.translatesAutoresizingMaskIntoConstraints = false
		centerBottomStackView.axis = .horizontal
		centerBottomStackView.distribution = .fillEqually
		
		view.addSubview(centerBottomStackView)
		
		// restricciones a 'top center stack view'
		NSLayoutConstraint.activate([
			// ancla 'topStackView' con el tope de la supervista
			centerBottomStackView.topAnchor.constraint(equalTo: view.centerYAnchor),
			// ancla 'topStackView' con el lado izquierdo de la supervista
			centerBottomStackView.leadingAnchor.constraint(equalTo: centerStackView.leadingAnchor),
			// ancla 'topStackView' con el lado derecho de la supervista
			centerBottomStackView.trailingAnchor.constraint(equalTo: centerStackView.trailingAnchor),
			// ancla 'topStackView' con el fondo de la supervista
			centerBottomStackView.bottomAnchor.constraint(equalTo: centerStackView.bottomAnchor)
			])
		
		/////////////////////////
		/// Bottom Stack View ///
		/////////////////////////
		
		// MARK: - bottom stack view
		
		bottomStackView.translatesAutoresizingMaskIntoConstraints = false
		bottomStackView.axis = .horizontal
		bottomStackView.distribution = .fillEqually

		view.addSubview(bottomStackView)
		
		// restricciones a 'bottom stack view'
		NSLayoutConstraint.activate([
			bottomStackView.topAnchor.constraint(equalTo: centerStackView.bottomAnchor),
			bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			bottomStackView.heightAnchor.constraint(equalToConstant: 32),
			bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
			])
		
		///////////////////
		/// Play Button ///
		///////////////////
		
		// MARK: -  play button constraints
		
		view.addSubview(playButton)
		
		NSLayoutConstraint.activate([
			// ancla 'play button' en el centro de la pantalla
			playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
			playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			playButton.heightAnchor.constraint(equalToConstant: 130),
			playButton.widthAnchor.constraint(equalToConstant: 130)
			])
		
		
		//////////////////////////
		/// Activity Indicator ///
		//////////////////////////
		
		// MARK: - activity indicator constraints
		
		view.addSubview(activityIndicator)
		NSLayoutConstraint.activate([
			// ancla 'play button' en el centro de la pantalla
			activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
			])
		
		
				//////////////////////
				/// Top Stack View ///
				//////////////////////
		
				// MARK: - top stack view
		
				topStackView.translatesAutoresizingMaskIntoConstraints = false
				topStackView.axis = .horizontal
				topStackView.distribution = .fillEqually
				topStackView.spacing = 90
		
				view.addSubview(topStackView)
		
				// restricciones a 'top stack view'
				NSLayoutConstraint.activate([
					topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
					topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
					topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
					topStackView.heightAnchor.constraint(equalToConstant: 50)
					])

	} // end func
	
	
} // end class
