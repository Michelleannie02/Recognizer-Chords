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
		// NOTE:
		// if I go back to the root view controller it will return to the LAST STATE of the screen and I do not want that since it would keep the state of the score bar and it would be incorrect because the scores (both hits and errors) should be back to 0
		//view.window?.rootViewController?.dismiss(animated: true, completion: nil)
		
		// if I return with this method the vc is reloaded with the values of scores to 0 and that is what I want
		performSegue(withIdentifier: "first screen view controller", sender: nil)
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
