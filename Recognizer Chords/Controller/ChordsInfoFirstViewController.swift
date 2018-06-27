//
//  ChordsInfoFirst_ViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 19/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
...
*/

class ChordsInfoFirstViewController: UIViewController {
	
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	// major
	@IBOutlet weak var majorView: UIView!
	@IBOutlet weak var majorLabel: UILabel!
	@IBOutlet weak var majorNotationImage: UIImageView!
	@IBOutlet weak var majorInfoLabel: UILabel!
	
	// minor
	@IBOutlet weak var minorView: UIView!
	@IBOutlet weak var minorLabel: UILabel!
	@IBOutlet weak var minorNotationImage: UIImageView!
	@IBOutlet weak var minorInfoLabel: UILabel!
	
	// close
	@IBOutlet weak var closeButton: UIButton!
	
	
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
	
	/// task: cerrar la pantalla de 'chords info'
	@IBAction func closeChordsInfo(_ sender: UIButton) {
		
		dismiss(animated: true, completion: nil)
		
		print("close presionado")
		
		
	}
	
	
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
	
	/// esconde la barra de estado
	override var prefersStatusBarHidden: Bool {
		return true
	}
	

}
