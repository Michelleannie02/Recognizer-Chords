//
//  Counter.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 01/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Model */

import Foundation

/* Abstract:
Un contador que cuenta la cantidad de veces que fue presionado el botón 'play'.
*/

struct Counter {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	var playButtonValue = 0

	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	mutating func incrementPlayButton() {
		playButtonValue += 1
	}
	
	
} // end struct




