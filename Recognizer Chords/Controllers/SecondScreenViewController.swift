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
	
	
	//*****************************************************************
	// MARK: - Actions
	//*****************************************************************
	

	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón PLAY ha sido tapeado")
		
	}
	
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón MAYOR ha sido tapeado")
		
	}
	
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón MENOR ha sido tapeado")
	}
	
	@IBAction func diminishedButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón DISMINUÍDO ha sido tapeado")
	}
	
	@IBAction func augmentedButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón AUMENTADO ha sido tapeado")
		
	}
	


	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
	
	// view controller methods
	
	override func viewDidLoad() {
			super.viewDidLoad()

			// Do any additional setup after loading the view.
	}

	

} // end class
