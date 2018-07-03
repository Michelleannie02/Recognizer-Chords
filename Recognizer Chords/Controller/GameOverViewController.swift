//
//  GameOverViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 12/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet weak var startAgainButton: UIButton!
	@IBOutlet weak var gameOverLabel: UILabel!
	
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
		autolayout()
    }

	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	/// task: al presionar el botón se vuelve a la pantalla inicial
	@IBAction func startAgainButtonPressed(_ sender: UIButton) {
		view.window?.rootViewController?.dismiss(animated: true, completion: nil)
	}
	
	//*****************************************************************
	// MARK: - Autolayout
	//*****************************************************************
	
	func autolayout() {
		
		startAgainButton.translatesAutoresizingMaskIntoConstraints = false
		gameOverLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			// start again button constraints
			startAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			startAgainButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
				
			// game over label constraints
			gameOverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			gameOverLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		
			])
	}

} // end class
