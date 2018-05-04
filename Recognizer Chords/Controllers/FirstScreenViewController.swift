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
	
	
	
	var collectionData = ["🌚", "🔋", "🤡", "🎲"]

	
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	// el menú con 4 opciones

	
	
	
	
//	var menuModel: UIImage = ["play_button.png", "failure_image.png", "point_image.png"]
	
	// menu items
//	var chordMenuItem = UIImage(imageLiteralResourceName: "gClef_image.png")
//	var settingMenuItem: UIImage = UIImage(imageLiteralResourceName: "settings_image.png")
//	var scoreMenuItem: UIImage = UIImage(imageLiteralResourceName: "lastScores_image.png")
//	var headphonesMenuItem: UIImage = UIImage(imageLiteralResourceName: "headphones_image.png")
	
	//var menuModel: [UIImage] = [chordMenuItem, ]
	
	
	//imageDePrueba.image = UIImage(named: "play_button.png")

	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	// major, minor & play button ///////////////////////////////////////////
	
	

	
	

	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
	
		// view controller methods
	
		// cuando la supervista ya se cargó...
    override func viewDidLoad() {
        super.viewDidLoad()
		
			
			
			
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


	

