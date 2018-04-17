//
//  LastScoresViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 4/17/18.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class LastScoresViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var userName = "Juan"
	var s1 = 10
	var s2 = 5
	var s3 = 3
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	// un mensaje personalizado con los últimos scores
	
	@IBOutlet weak var messageScore: UITextView!
	// el último score
	@IBOutlet weak var lastScore: UILabel!
	// el penúltimo score
	@IBOutlet weak var penultimoScore: UILabel!
	// el antepenúltimo score
	@IBOutlet weak var antepenultimoScore: UILabel!
	
	//*****************************************************************
	// MARK: - Actions
	//*****************************************************************
	
	// despide el vc actual
	@IBAction func dismissScreenButton(_ sender: UIButton) {
		
		
		self.dismiss(animated: true, completion: nil)
		
		
	}
	
	
	
	
	
	
	
	
	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************

	override func viewDidLoad() {
			super.viewDidLoad()
			
		// pone los scores
		setScores()

    }
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	// pone los últimos tres scores
	func setScores() {
		
		// pone un mensaje personalizado
		self.messageScore.text = "\(userName), this is your last 3 scores"
		
		// pone los scores
		self.lastScore.text = "\(s1) pts"
		self.penultimoScore.text = "\(s2) pts"
		self.antepenultimoScore.text = "\(s3) pts"
		
	}

    



}
