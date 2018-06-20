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

func setAutolayout () {
	
	
	//		pointsBar.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 260), for: .vertical)
	//		errorsBar.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 260), for: .vertical)
	
	//		// rota el texto de los botones del menú
	//		gClefButton.transform = CGAffineTransform(rotationAngle: -120)
	//		settingsButton.transform = CGAffineTransform(rotationAngle: -120)
	//		lastScoresButton.transform = CGAffineTransform(rotationAngle: -120)
	//		headphonesButton.transform = CGAffineTransform(rotationAngle: -120)
	
	// translate autoresizing mask into constraints
	chordsInfoButton.translatesAutoresizingMaskIntoConstraints = false
	lastScoresButton.translatesAutoresizingMaskIntoConstraints =  false
	
	//botonMayor.translatesAutoresizingMaskIntoConstraints = false
	majorButton.translatesAutoresizingMaskIntoConstraints = false
	minorButton.translatesAutoresizingMaskIntoConstraints = false
	playButton.translatesAutoresizingMaskIntoConstraints = false
	activityIndicator.translatesAutoresizingMaskIntoConstraints = false
	
	pointsBarView.translatesAutoresizingMaskIntoConstraints = false
	
	//chordsInfo.translatesAutoresizingMaskIntoConstraints = false
	
	
	// definiendo los stack views
	
	// TOP
	let topStackView = UIStackView(arrangedSubviews: [chordsInfoButton, lastScoresButton])
	
	// CENTER
	let centerStackView = UIStackView(arrangedSubviews: [majorButton,minorButton])
	
	// BOTTOM
	let bottomStackView = UIStackView(arrangedSubviews: [pointsBarView, errorsBarView])
	
	print("🎲\(bottomStackView.arrangedSubviews)")
	
	// ANEXOS
//	let chordsInfoStackView = UIStackView(arrangedSubviews: [chordsInfo])
//	let lastScoresStackView = UIStackView(arrangedSubviews: [chordsInfo])
	
	
	//////////////////////
	/// Top Stack View ///
	//////////////////////
	
	// MARK: - top stack view
	
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
//		topStackView.bottomAnchor.constraint(equalTo:centerStackView.centerYAnchor),
		topStackView.heightAnchor.constraint(equalToConstant: 10)
		])
	
	
	/////////////////////////
	/// Center Stack View ///
	/////////////////////////
	
	// MARK: - center stack view
	
	//let centerStackView = UIStackView(arrangedSubviews: [majorButton, minorButton])
	centerStackView.translatesAutoresizingMaskIntoConstraints = false
	centerStackView.axis = .vertical
	centerStackView.distribution = .fillEqually
	
	view.addSubview(centerStackView)
	
	// restricciones a 'center stack view'
	NSLayoutConstraint.activate([
		centerStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
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
		bottomStackView.heightAnchor.constraint(equalToConstant: 30),
		bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
		
		])
	
	///////////////////
	/// Play Button ///
	///////////////////
	
	// MARK: -  play button constraints
	
	view.addSubview(playButton)
	NSLayoutConstraint.activate([
		// ancla 'play button' en el centro de la pantalla
		playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
		playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
	
	///////////////////
	/// Chords Info ///
	///////////////////
	
//	chordsInfoStackView.translatesAutoresizingMaskIntoConstraints = false
//	view.addSubview(chordsInfoStackView)
//	// restricciones al contenedor de prueba
//	NSLayoutConstraint.activate([
//		// top
//		chordsInfoStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
//		// leading
//		chordsInfoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//		// trailing
//		chordsInfoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//		// height
//		chordsInfoStackView.heightAnchor.constraint(equalToConstant: 250)
//
//		])
//
//	print("🥉\(chordsInfoStackView.arrangedSubviews.count)")
	
	///////////////////
	/// Scores Info ///
	///////////////////
//	
//	lastScoresStackView.translatesAutoresizingMaskIntoConstraints = false
//	view.addSubview(lastScoresStackView)
//	// restricciones al contenedor de prueba
//	NSLayoutConstraint.activate([
//		// top
//		lastScoresStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
//		// leading
//		lastScoresStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//		// trailing
//		lastScoresStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//		// height
//		lastScoresStackView.heightAnchor.constraint(equalToConstant: 250)
//		
//		])
	
	
	// test
	print("👻\(pointsBarView.layer)")
	
	
	}


} // end class
