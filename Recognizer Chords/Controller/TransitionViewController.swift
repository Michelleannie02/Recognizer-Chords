//
//  TransitionViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 13/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {

	
	
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
	
	@IBAction func avanzarButton(_ sender: UIButton) {
		
		
		// avanza a la siguiente pantalla
		let controller = self.storyboard!.instantiateViewController(withIdentifier: "Second Screen View Controller")
		self.present(controller, animated: true, completion: nil)
		
	}
	
	
	


}
