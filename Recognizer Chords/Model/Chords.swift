//
//  Chords.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 05/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import Foundation
import AVFoundation


struct Chords {
	
	static var audioPlayer: AVAudioPlayer!
	
// acorde mayor
	static let acordeMayorUrl = Bundle.main.url(forResource: "ab5", withExtension: "aiff")
	static let acordeMayor2Url = Bundle.main.url(forResource: "g2", withExtension: "aiff")
	static let acordeMayor3Url = Bundle.main.url(forResource: "ab6", withExtension: "aiff")
	static let acordeMayor4Url = Bundle.main.url(forResource: "ab7", withExtension: "aiff")
	
	
	// task: prepara los acordes a sonar
	static func setupChord() {

						do {
							audioPlayer = try AVAudioPlayer(contentsOf: Chords.acordeMayorUrl!)
							audioPlayer.prepareToPlay()


						} catch let error as NSError {

							print(error.debugDescription)
						}


}
	
	static func setupChord2() {
		
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: Chords.acordeMayor3Url!)
			audioPlayer.prepareToPlay()
			
			
		} catch let error as NSError {
			
			print(error.debugDescription)
		}
		
		
	}
	
	static func setupChord3() {
		
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: Chords.acordeMayor4Url!)
			audioPlayer.prepareToPlay()
			
			
		} catch let error as NSError {
			
			print(error.debugDescription)
		}
		
		
	}
	
	
	static let arrayChords = [setupChord(), setupChord2(), setupChord3()]



} // end struct
