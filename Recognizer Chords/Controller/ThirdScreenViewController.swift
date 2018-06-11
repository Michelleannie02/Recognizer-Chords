//
//  ThirdScreenViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 4/16/18.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit
import AVFoundation

/* Abstract:
TODO: completar...
*/

class ThirdScreenViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// una variable que contiene la cantidad de veces que fue presionado el botón 'play'
	var counter = Counter()
	
	// lenguaje actual
	var englishLanguage = true
	
	// reproductor de audio
	var audioPlayer: AVAudioPlayer?
	// los datos el acorde elegido

	let firebase = FirebaseClient()
	var dataChord = FirebaseClient.dataChord
	
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	// los botones del menú superior
	@IBOutlet weak var gClefButton: UIButton!
	@IBOutlet weak var settingsButton: UIButton!
	@IBOutlet weak var lastScoresButton: UIButton!
	@IBOutlet weak var headphonesButton: UIButton!
	
	// el fondo de la pantalla
	@IBOutlet weak var topLeftBackground: UIImageView!
	@IBOutlet weak var topRightBackground: UIImageView!
	@IBOutlet weak var bottomLeftBackground: UIImageView!
	@IBOutlet weak var bottomRightBackground: UIImageView!
	
	// los botones de la pantalla
	@IBOutlet weak var playButton: UIButton!
	@IBOutlet weak var majorButton: UIButton!
	@IBOutlet weak var minorButton: UIButton!
	@IBOutlet weak var augmentedButton: UIButton!
	@IBOutlet weak var diminishedButton: UIButton!
	@IBOutlet weak var majorSevenButton: UIButton!
	@IBOutlet weak var minorSevenButton: UIButton!
	@IBOutlet weak var majorSevenMinorButton: UIButton!
	@IBOutlet weak var minorSevenMajorButton: UIButton!
	
	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
	
	// task: cargar la supervista..
	override func viewDidLoad() { // 
		super.viewDidLoad()
		
		// el vc se convierte en objeto delegado de ambos protocolos

		
		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		autolayout()
		
		
		firebase.setupChords(screen: self)
	}

	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		print("el botón de mayor fue presionado")
		
	}
	
	@IBAction func minorSevenButtonPressed(_ sender: UIButton) {
		
		print("el botón de menor con séptima menor fue presionado")
		
	}
	
	@IBAction func majorSevenPressed(_ sender: UIButton) {
		
		print("el botón de mayor con séptima fue presionado")

	}
	
	@IBAction func augmentedButtonPressed(_ sender: UIButton) {
		
		print("el botón de aumentado fue presionado")

	}
	
	@IBAction func diminishedButtonPressed(_ sender: UIButton) {
		
		print("el botón de disminuído presionado")

	}
	
	@IBAction func minorSevenMajorButtonPressed(_ sender: UIButton) {
		
		print("el botón de menor con séptima mayor fue presionado")

	}
	
	@IBAction func majorSevenMinorPressed(_ sender: UIButton) {
		
		print("el botón de mayor con séptima menor fue presionado")

	}
	
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
		print("el botón de menor fue presionado")

	}
	
	
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón de play fue presionado")
		
		majorButton.isEnabled = true
		minorButton.isEnabled = true
		
		
		// Contador ///////////////////////////////////////////////
		
		counter.incrementPlayButton()
		print("✏️\(counter.playButtonValue)")
		
		if counter.playButtonValue == 50 { // cambiar luego a 3
			
			counter.playButtonValue = 0
			playButton.isHidden = true
			majorButton.isEnabled = true
			minorButton.isEnabled = true
		}
		
		
		// Audio //////////////////////////////////////////////////
		
		// 1-prepara el acorde a sonar...
		//setupChords()
		
		
		// 2-lo pone el el reproductor
		do {
			audioPlayer = try AVAudioPlayer(data: self.dataChord)
			audioPlayer?.prepareToPlay()
			
		} catch let error as NSError {
			
			print(error.debugDescription)
		}
		
		
		// 3-y lo reproduce
		audioPlayer?.play()
		
		


	}
	
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
	
	/// esconde la barra de estado
	override var prefersStatusBarHidden: Bool {
		return true
	}
	

} // end class





