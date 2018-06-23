//
//  GCDBlackBox.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 13/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Dispatch */

import Foundation

//*****************************************************************
// MARK: - Dispatch - UI Updates on Main Queue
//*****************************************************************

/// task: realizar las actualizaciones de la interfaz del usuario en la cola principal.
func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
	
	DispatchQueue.main.async {
		
		updates()
	
	}
	
}
