//
//  FirebaseConstants.swift
//  
//
//  Created by Luciano Schillagi on 10/06/2018.
//

import Foundation

extension FirebaseClient {
	
	static let gsRef = "gs://recognizer-chords.appspot.com/"
	
	struct MajorChords {
		
		static let refMajorChords = "M/C4_dens4.mp3"
		static let items = ["M/C4_dens4.mp3", "M/E4_dens4.mp3", "M/G4_dens4.mp3"]
		

	}
	
	struct MinorChords {
		
		static let refMinorChords = "m/Cm4_dens4.mp3"
		static let items = ["m/Cm4_dens4.mp3","m/Em4_dens4.mp3","m/Gm4_dens4.mp3"]
		
	}
	
	// gs://recognizer-chords.appspot.com/d/Cdim4_dens4.mp3
	struct DiminishedChords {
		
		static let refDiminishedChords = "d/Cdim4_dens4.mp3"
		static let items = ["d/Cdim4_dens4.mp3", "d/Edim4_dens4.mp3", "d/Gdim4_dens4.mp3"]
		
		
	}
	
	// gs://recognizer-chords.appspot.com/A/Caug4_dens4.mp3
	struct AugmentedChords {
		
		static let refAugmentedChords = "A/Caug4_dens4.mp3"
		static let items = ["A/Caug4_dens4.mp3", "A/Eaug4_dens4.mp3", "A/Gaug4_dens4.mp3"]
		
		
	}
	
	
	
	
	
	
	
	
} // end ext
