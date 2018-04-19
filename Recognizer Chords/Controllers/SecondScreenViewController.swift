//
//  SecondScreenViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 4/16/18.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
TODO: completar...
*/

class SecondScreenViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// esconde la barra de estado
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	// los botones de los acordes..
	@IBOutlet weak var majorButton: UIButton!
	@IBOutlet weak var minorButton: UIButton!
	@IBOutlet weak var diminishedButton: UIButton!
	@IBOutlet weak var augmentedButton: UIButton!
	
	@IBOutlet weak var myLastScores: UIView!
	
	//*****************************************************************
	// MARK: - Actions
	//*****************************************************************
	

	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		
		
	}
	
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		
	}
	
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
		
	}
	
	@IBAction func diminishedButtonPressed(_ sender: UIButton) {
		
		
	}
	
	@IBAction func augmentedButtonPressed(_ sender: UIButton) {
		
		
		
	}
	
	
	// last 3 scores ////////////////////////////////////////////////////////
	
	@IBAction func openScoreMessage(_ sender: UIButton) {
		
		// emerge esta vista
		self.myLastScores.isHidden = false
		
		// se esconde el botón de flecha para arriba anterior
		self.upArrow.isHidden = true
		
	}
	
	@IBAction func closeScoreMessage(_ sender: UIButton) {
		
		
	}
	
	@IBAction func lastScoresButton(_ sender: UIButton) {
		
		// lleva al 'LastScoresVC'
		
	}
	
	

	
	
	
	
	

	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
	override func viewDidLoad() {
			super.viewDidLoad()

			// Do any additional setup after loading the view.
	}

	
	
	
	

} // end class
