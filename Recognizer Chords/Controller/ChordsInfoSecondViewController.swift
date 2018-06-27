//
//  ChordsInfoSecondViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 19/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class ChordsInfoSecondViewController: UIViewController {
	

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
	
	// diminished
	@IBOutlet weak var dimView: UIView!
	@IBOutlet weak var dimLabel: UILabel!
	@IBOutlet weak var dimNotationImage: UIImageView!
	@IBOutlet weak var dimInfoLabel: UILabel!
	
	// augmented
	@IBOutlet weak var augView: UIView!
	@IBOutlet weak var augLabel: UILabel!
	@IBOutlet weak var augNotationImage: UIImageView!
	@IBOutlet weak var augInfoLabel: UILabel!
	
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
	
	@IBAction func closeChordsInfo(_ sender: UIButton) {
		
		dismiss(animated: true, completion: nil)
		
	}
	
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
	
	/// esconde la barra de estado
	override var prefersStatusBarHidden: Bool {
		return true
	}

}
