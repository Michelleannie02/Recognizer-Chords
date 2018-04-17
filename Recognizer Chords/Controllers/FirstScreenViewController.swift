//
//  FirstScreenViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 4/16/18.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:

Primera pantalla que contiene un botón de play y dos botones, uno representando un acorde mayor y otro uno menor.

El usuario tapea el botón de play, suena aleatoriamente un acorde que puede ser mayor o menor. El usuario entonces debe, de acuerdo a su audiopercepción, elegir si el acorde fue mayor o menor presionando el botón correspondiente. Si acierta "avanza" un casillero, sino acierta pierde una posición. Si desacierta tres veces en una sesión vuelve a la posición inicial. Si acierta ocho veces seguidas pasa a la siguiente pantalla.

*/

class FirstScreenViewController: UIViewController {
	
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// esconde la barra de estado
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet weak var majorButton: UIButton!
	@IBOutlet weak var minorButton: UIButton!
	
	// la flecha para que emerja el mensaje de scores
	@IBOutlet weak var upArrow: UIButton!
	// el mensaje que emerge para acceder a los últimos scores
	@IBOutlet weak var myLastScoresView: UIView!
	
	
	

	//*****************************************************************
	// MARK: - Actions
	//*****************************************************************
	
	// play button
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
	}
	
	// major button
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		//self.minorButton.backgroundColor = .white
		
	}
	
	// minor button
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
	}
	
	
	@IBAction func openScoreMessage(_ sender: UIButton) {
		
			// emerge esta vista
			self.myLastScoresView.isHidden = false
		
			// se esconde el botón de flecha para arriba anterior
			self.upArrow.isHidden = true
	
	}
	
	
	// cierra la pestaña del mensaje de score
	@IBAction func closeScoreMessage(_ sender: UIButton) {
		
		// touch drag inside
		
		// esconde la pestaña antes abierta
		self.myLastScoresView.isHidden = true
		
		// repone la fecha para arriba
		self.upArrow.isHidden = false
		
	}
	
	@IBAction func lastScoresButton(_ sender: UIButton) {
		
		// lleva al 
		
	}
	

	//*****************************************************************
	// MARK: - Life Cycle (View Controller Methods)
	//*****************************************************************
	
		// cuando la supervista ya se cargó...
    override func viewDidLoad() {
        super.viewDidLoad()

			self.myLastScoresView.isHidden = true
			
			
			
			
    }



	//*****************************************************************
	// MARK: - Navigation
	//*****************************************************************
	
		///In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			
         //Get the new view controller using segue.destinationViewController.
         //Pass the selected object to the new view controller.
    }


} // end class
