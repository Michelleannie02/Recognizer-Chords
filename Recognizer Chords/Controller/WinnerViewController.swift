//
//  WinnerViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 26/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	

	@IBOutlet weak var greatEarLabel: UILabel!
	@IBOutlet weak var startAgainButton: UIButton!
	
	
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
	
	
	@IBAction func startAgainButtonPressed(_ sender: UIButton) {

			let controller = self.storyboard!.instantiateViewController(withIdentifier: "first screen view controller")
			self.present(controller, animated: true, completion: nil)
			

	}
	
	
	
	
	
	//*****************************************************************
	// MARK: - Autolayout
	//*****************************************************************
	
	func autolayout() {
		
		greatEarLabel.translatesAutoresizingMaskIntoConstraints = false
		startAgainButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			// start again button constraints
			startAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			startAgainButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
			
			// great ear label constraints
			greatEarLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			greatEarLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
			
			])
		
		
		
		
		
		
	}
	

   

}
