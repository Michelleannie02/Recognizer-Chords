//
//  GCDBlackBox.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 13/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import Foundation


func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
	DispatchQueue.main.async {
		updates()
	}
}
