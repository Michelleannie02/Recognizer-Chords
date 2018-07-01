//
//  FirstScreen_Autolayout.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 09/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

/* Abstract:
Aplica restricciones a los elementos gráficos de la primer pantalla.
*/

extension FirstScreenViewController {

//*****************************************************************
// MARK: - Autolayout
//*****************************************************************

func autolayout () {
	
	// translate autoresizing mask into constraints
	chordsInfoButton.translatesAutoresizingMaskIntoConstraints = false
	lastScoresButton.translatesAutoresizingMaskIntoConstraints =  false
	
	majorButton.translatesAutoresizingMaskIntoConstraints = false
	minorButton.translatesAutoresizingMaskIntoConstraints = false
	
	playButton.translatesAutoresizingMaskIntoConstraints = false
	activityIndicator.translatesAutoresizingMaskIntoConstraints = false
	
	pointsBarView.translatesAutoresizingMaskIntoConstraints = false
	errorsBarView.translatesAutoresizingMaskIntoConstraints = false

	/// stack views
	
	// top
	let topStackView = UIStackView(arrangedSubviews: [chordsInfoButton, lastScoresButton])
	
	// center
	let centerStackView = UIStackView(arrangedSubviews: [majorButton,minorButton])
	
	// bottom
	let bottomStackView = UIStackView(arrangedSubviews: [pointsBarView, errorsBarView])
	
	
	/////////////////////////
	/// Center Stack View ///
	/////////////////////////
	
	// MARK: - center stack view
	
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
		playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
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
		activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
		activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	

	//////////////////////
	/// Top Stack View ///
	//////////////////////
	
	// MARK: - top stack view
	
	topStackView.translatesAutoresizingMaskIntoConstraints = false
	topStackView.axis = .horizontal
	topStackView.distribution = .equalSpacing
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
