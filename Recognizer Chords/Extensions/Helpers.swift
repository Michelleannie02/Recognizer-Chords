//
//  Helpers.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 04/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

//*****************************************************************
// MARK: - Collection Randmo Element
//*****************************************************************

extension Collection where Index == Int {
	
	/**
	Picks a random element of the collection.
	
	- returns: A random element of the collection.
	*/
	func randomElement() -> Iterator.Element? {
		return isEmpty ? nil : self[Int(arc4random_uniform(UInt32(endIndex)))]
	}
}

//*****************************************************************
// MARK: - Array Extention
//*****************************************************************

extension Array {
	func getFirstElements(upTo position: Int) -> Array<Element> {
		let arraySlice = self[0 ..< position]
		return Array(arraySlice)
	}
	
}
