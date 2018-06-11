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
		
		
		//			// rota el texto de los botones del menú superior
		//			gClefButton.transform = CGAffineTransform(rotationAngle: -120)
		//			settingsButton.transform = CGAffineTransform(rotationAngle: -120)
		//			lastScoresButton.transform = CGAffineTransform(rotationAngle: -120)
		//			headphonesButton.transform = CGAffineTransform(rotationAngle: -120)
		
		// translate autoresizing mask into constraints
		
		// botones del menú superior
		gClefButton.translatesAutoresizingMaskIntoConstraints = false
		lastScoresButton.translatesAutoresizingMaskIntoConstraints = false
		
		
		// botones de la interfaz
		majorButton.translatesAutoresizingMaskIntoConstraints = false
		minorButton.translatesAutoresizingMaskIntoConstraints = false
		augmentedButton.translatesAutoresizingMaskIntoConstraints = false
		diminishedButton.translatesAutoresizingMaskIntoConstraints = false
		playButton.translatesAutoresizingMaskIntoConstraints = false
		
		ci.translatesAutoresizingMaskIntoConstraints = false
		
		
		// MARK: - Stack Views
		
		// definiendo los stack views
		
		
		
		// TOP ////////////////////////////////////////////////////////////////
		let topStackView = UIStackView(arrangedSubviews: [gClefButton, lastScoresButton, languageButton])
		
		
		// CENTER //////////////////////////////////////////////////////////////
		
		// center-top
		let centerTopStackView = UIStackView(arrangedSubviews: [majorButton, diminishedButton])
		
		// center-bottom
		let centerBottomStackView = UIStackView(arrangedSubviews: [augmentedButton, minorButton])
		
		let centerStackView = UIStackView(arrangedSubviews: [centerTopStackView, centerBottomStackView])
		
		// BOTTOM //////////////////////////////////////////////////////////////
		let bottomStackView = UIStackView(arrangedSubviews: [pointsBarView, errorsBarView])
		
		// ANEXOS
		let chordsInfoStackView = UIStackView(arrangedSubviews: [ci])
		let lastScoresStackView = UIStackView(arrangedSubviews: [ci])
		
		
		//////////////////////
		/// Top Stack View ///
		//////////////////////
		
		topStackView.translatesAutoresizingMaskIntoConstraints = false
		topStackView.axis = .horizontal
		topStackView.distribution = .fillEqually
		topStackView.spacing = 150
		
		view.addSubview(topStackView)
		
		// restricciones a 'top stack view'
		NSLayoutConstraint.activate([
			topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
			topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
			topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
			topStackView.heightAnchor.constraint(equalToConstant: 10)
			])
		
		
		/////////////////////////
		/// Center Stack View ///
		/////////////////////////
		
		// center (root) 👈
		centerStackView.translatesAutoresizingMaskIntoConstraints = false
		centerStackView.axis = .vertical
		centerStackView.distribution = .fillEqually
		
		view.addSubview(centerStackView)
		
		// restricciones a 'center stack view'
		NSLayoutConstraint.activate([
			// ancla 'topStackView' con el tope de la supervista
			centerStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
			// ancla 'topStackView' con el lado izquierdo de la supervista
			centerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			// ancla 'topStackView' con el lado derecho de la supervista
			centerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			// ancla 'topStackView' con el fondo de la supervista
			centerStackView.bottomAnchor.constraint(equalTo: centerStackView.topAnchor)
			])
		
		// (center-top)
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
		
		// (center-bottom)
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
		
		bottomStackView.translatesAutoresizingMaskIntoConstraints = false
		bottomStackView.axis = .horizontal
		bottomStackView.distribution = .fillEqually
		
		
		view.addSubview(bottomStackView)
		
		// restricciones a 'bottom stack view'
		NSLayoutConstraint.activate([
			bottomStackView.topAnchor.constraint(equalTo: centerStackView.bottomAnchor),
			bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			bottomStackView.heightAnchor.constraint(equalToConstant: 50),
			bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
		
		///////////////////
		/// Chords Info ///
		///////////////////
		
		chordsInfoStackView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(chordsInfoStackView)
		// restricciones al contenedor de prueba
		NSLayoutConstraint.activate([
			// top
			chordsInfoStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
			// leading
			chordsInfoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			// trailing
			chordsInfoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			// height
			chordsInfoStackView.heightAnchor.constraint(equalToConstant: 250)
			
			])
		
		print("🥉\(chordsInfoStackView.arrangedSubviews.count)")
		
		///////////////////
		/// Scores Info ///
		///////////////////
		
		lastScoresStackView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(lastScoresStackView)
		// restricciones al contenedor de prueba
		NSLayoutConstraint.activate([
			// top
			lastScoresStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
			// leading
			lastScoresStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			// trailing
			lastScoresStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			// height
			lastScoresStackView.heightAnchor.constraint(equalToConstant: 250)
			
			])
		
		
		
		
	}
	
	
} // end class
