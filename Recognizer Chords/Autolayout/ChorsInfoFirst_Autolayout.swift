//
//  ChorsInfoFirst_Autolayout.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 19/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

extension ChordsInfoFirstViewController {
	
	func autolayout () {
		
		translatesAutoresizingMaskIntoConstraints()
		
		NSLayoutConstraint.activate([

			// major constraints
			majorView.topAnchor.constraint(equalTo: view.topAnchor),
			majorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			majorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			majorView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
			majorLabel.bottomAnchor.constraint(equalTo: majorNotationImage.topAnchor, constant: -25),
			majorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			majorNotationImage.centerXAnchor.constraint(equalTo: majorView.centerXAnchor),
			majorNotationImage.centerYAnchor.constraint(equalTo: majorView.centerYAnchor),
			majorInfoLabel.topAnchor.constraint(equalTo: majorNotationImage.bottomAnchor, constant: 30),
			majorInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		
			// minor constraints
			minorView.topAnchor.constraint(equalTo:view.centerYAnchor),
			minorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			minorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			minorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			minorLabel.bottomAnchor.constraint(equalTo: minorNotationImage.topAnchor, constant: -25),
			minorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			minorNotationImage.centerXAnchor.constraint(equalTo: minorView.centerXAnchor),
			minorNotationImage.centerYAnchor.constraint(equalTo: minorView.centerYAnchor),
			minorInfoLabel.topAnchor.constraint(equalTo: minorNotationImage.bottomAnchor, constant: 30),
			minorInfoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

			// close button constraints
			closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
			closeButton.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -20)
			])
		}
	
	func translatesAutoresizingMaskIntoConstraints() {
		majorView.translatesAutoresizingMaskIntoConstraints = false
		majorLabel.translatesAutoresizingMaskIntoConstraints =  false
		majorNotationImage.translatesAutoresizingMaskIntoConstraints = false
		majorInfoLabel.translatesAutoresizingMaskIntoConstraints = false
		minorView.translatesAutoresizingMaskIntoConstraints = false
		minorLabel.translatesAutoresizingMaskIntoConstraints = false
		minorNotationImage.translatesAutoresizingMaskIntoConstraints = false
		minorInfoLabel.translatesAutoresizingMaskIntoConstraints = false
		closeButton.translatesAutoresizingMaskIntoConstraints = false
	}
	
}
