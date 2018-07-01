//
//  ChordInfoSecond_Autolayout.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 19/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

extension ChordsInfoSecondViewController {
	
	func autolayout () {
		
		translatesAutoresizingMaskIntoConstraints()
		
		NSLayoutConstraint.activate([
			
			// major view constraints
			majorView.topAnchor.constraint(equalTo: view.topAnchor),
			majorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			majorView.trailingAnchor.constraint(equalTo: view.centerXAnchor),
			majorView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
			majorLabel.bottomAnchor.constraint(equalTo: majorNotationImage.topAnchor, constant: -25),
			majorLabel.centerXAnchor.constraint(equalTo: majorView.centerXAnchor),
			majorNotationImage.centerXAnchor.constraint(equalTo: majorView.centerXAnchor),
			majorNotationImage.centerYAnchor.constraint(equalTo: majorView.centerYAnchor),
			majorInfoLabel.topAnchor.constraint(equalTo: majorNotationImage.bottomAnchor, constant: 30),
			majorInfoLabel.centerXAnchor.constraint(equalTo: majorView.centerXAnchor),
			
			// diminished view constraints
			dimView.topAnchor.constraint(equalTo:view.topAnchor),
			dimView.leadingAnchor.constraint(equalTo: majorView.trailingAnchor),
			dimView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			dimView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
			dimLabel.bottomAnchor.constraint(equalTo: dimNotationImage.topAnchor, constant: -25),
			dimLabel.centerXAnchor.constraint(equalTo: dimView.centerXAnchor),
			dimNotationImage.centerXAnchor.constraint(equalTo: dimView.centerXAnchor),
			dimNotationImage.centerYAnchor.constraint(equalTo: dimView.centerYAnchor),
			dimInfoLabel.topAnchor.constraint(equalTo: dimNotationImage.bottomAnchor, constant: 30),
			dimInfoLabel.centerXAnchor.constraint(equalTo: dimView.centerXAnchor),
		
			// minor view constraints
			minorView.topAnchor.constraint(equalTo:view.centerYAnchor),
			minorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			minorView.trailingAnchor.constraint(equalTo: view.centerXAnchor),
			minorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			minorLabel.bottomAnchor.constraint(equalTo: minorNotationImage.topAnchor, constant: -25),
			minorLabel.centerXAnchor.constraint(equalTo: minorView.centerXAnchor),
			minorNotationImage.centerXAnchor.constraint(equalTo: minorView.centerXAnchor),
			minorNotationImage.centerYAnchor.constraint(equalTo: minorView.centerYAnchor),
			minorInfoLabel.topAnchor.constraint(equalTo: minorNotationImage.bottomAnchor, constant: 30),
			minorInfoLabel.centerXAnchor.constraint(equalTo: minorView.centerXAnchor),
			
			// augmented view constraints
			augView.topAnchor.constraint(equalTo:view.centerYAnchor),
			augView.leadingAnchor.constraint(equalTo: minorView.trailingAnchor),
			augView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			augView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			augLabel.bottomAnchor.constraint(equalTo: augNotationImage.topAnchor, constant: -25),
			augLabel.centerXAnchor.constraint(equalTo: augView.centerXAnchor),
			augNotationImage.centerXAnchor.constraint(equalTo: augView.centerXAnchor),
			augNotationImage.centerYAnchor.constraint(equalTo: augView.centerYAnchor),
			augInfoLabel.topAnchor.constraint(equalTo: augNotationImage.bottomAnchor, constant: 30),
			augInfoLabel.centerXAnchor.constraint(equalTo: augView.centerXAnchor),
			
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
			dimView.translatesAutoresizingMaskIntoConstraints = false
			dimLabel.translatesAutoresizingMaskIntoConstraints = false
			dimNotationImage.translatesAutoresizingMaskIntoConstraints = false
			dimInfoLabel.translatesAutoresizingMaskIntoConstraints = false
			augView.translatesAutoresizingMaskIntoConstraints = false
			augLabel.translatesAutoresizingMaskIntoConstraints = false
			augNotationImage.translatesAutoresizingMaskIntoConstraints = false
			augInfoLabel.translatesAutoresizingMaskIntoConstraints = false
			closeButton.translatesAutoresizingMaskIntoConstraints = false
	}
	
}
