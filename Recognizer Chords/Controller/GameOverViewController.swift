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
	// MARK: - VC Life Cycle
	//*****************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	@IBAction func recomenzarButtonPressed(_ sender: UIButton) {
		
		// TODO: volver a la pantalla inicial
		// avanza a la siguiente pantalla
		let controller = self.storyboard!.instantiateViewController(withIdentifier: "First Screen View Controller")
		self.present(controller, animated: true, completion: nil)
		
		
	}

	
}
