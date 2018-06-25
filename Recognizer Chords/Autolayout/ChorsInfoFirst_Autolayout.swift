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
		
		// translate autoresizing mask into constraints
		majorInfoView.translatesAutoresizingMaskIntoConstraints = false
		minorInfoView.translatesAutoresizingMaskIntoConstraints = false
		
		majorInfoStackView.translatesAutoresizingMaskIntoConstraints = false
		minorInfoStackView.translatesAutoresizingMaskIntoConstraints =  false
		

		
	NSLayoutConstraint.activate([
		
		// major info view
		majorInfoView.topAnchor.constraint(equalTo: view.topAnchor),
		majorInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
		majorInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		majorInfoView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
		
		// minor info view
		minorInfoView.topAnchor.constraint(equalTo:view.centerYAnchor),
		minorInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
		minorInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		minorInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		
		// major info stack view constraints
		majorInfoStackView.centerXAnchor.constraint(equalTo: majorInfoView.centerXAnchor),
		majorInfoStackView.centerYAnchor.constraint(equalTo:majorInfoView.centerYAnchor),
		
		minorInfoStackView.centerXAnchor.constraint(equalTo: minorInfoView.centerXAnchor),
		minorInfoStackView.centerYAnchor.constraint(equalTo: minorInfoView.centerYAnchor)
		
		
		
		])

		
		
		
	}
	
	
	
	
}
