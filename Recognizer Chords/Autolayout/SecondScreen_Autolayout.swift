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
		
		translatesAutoresizingMaskIntoConstraints()
		
		// MARK: - stack views
		let centerTopStackView = UIStackView(arrangedSubviews: [majorButton, diminishedButton]) // center top
		let centerBottomStackView = UIStackView(arrangedSubviews: [augmentedButton, minorButton]) // center-bottom
		let centerStackView = UIStackView(arrangedSubviews: [centerTopStackView, centerBottomStackView]) // center
		let bottomStackView = UIStackView(arrangedSubviews: [pointsBarView, errorsBarView]) // bottom
		let topStackView = UIStackView(arrangedSubviews: [chordsInfoButton, lastScoresButton]) // top
		
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
			centerStackView.topAnchor.constraint(equalTo: view.topAnchor),
			centerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			centerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			centerStackView.bottomAnchor.constraint(equalTo: centerStackView.topAnchor)
			])
		
		
		/// (center-top)
		centerTopStackView.translatesAutoresizingMaskIntoConstraints = false
		centerTopStackView.axis = .horizontal
		centerTopStackView.distribution = .fillEqually
		
		view.addSubview(centerTopStackView)
		
		// restricciones a 'top center stack view'
		NSLayoutConstraint.activate([
			centerTopStackView.topAnchor.constraint(equalTo:centerStackView.topAnchor),
			centerTopStackView.leadingAnchor.constraint(equalTo: centerStackView.leadingAnchor),
			centerTopStackView.trailingAnchor.constraint(equalTo: centerStackView.trailingAnchor),
			centerTopStackView.bottomAnchor.constraint(equalTo: view.centerYAnchor)
			])
		
		/// (center-bottom)
		centerBottomStackView.translatesAutoresizingMaskIntoConstraints = false
		centerBottomStackView.axis = .horizontal
		centerBottomStackView.distribution = .fillEqually
		
		view.addSubview(centerBottomStackView)
		
		// restricciones a 'top center stack view'
		NSLayoutConstraint.activate([
			centerBottomStackView.topAnchor.constraint(equalTo: view.centerYAnchor),
			centerBottomStackView.leadingAnchor.constraint(equalTo: centerStackView.leadingAnchor),
			centerBottomStackView.trailingAnchor.constraint(equalTo: centerStackView.trailingAnchor),
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
	
	
	func translatesAutoresizingMaskIntoConstraints() {
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
	}
	
	
} // end class
