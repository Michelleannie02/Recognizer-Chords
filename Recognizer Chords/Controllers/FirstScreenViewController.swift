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
	@IBOutlet weak var playButton: UIButton!
	
//	// la flecha para que se abra el 'options view'
//	@IBOutlet weak var upArrow: UIButton!
//	// la flecha para que se cierre el 'options view'
//	@IBOutlet weak var downArrow: UIButton!
//	
//	// una vista con las opciones de ver los últimos tres scores, ver una referencia de tipo de acordes y opciones de configuración
//	@IBOutlet weak var optionsView: UIView!
	

	
	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	// major, minor & play button ///////////////////////////////////////////
	
	// play button
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón PLAY ha sido tapeado")
	}
	
	// major button
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		//self.minorButton.backgroundColor = .white
		// test
		print("el botón MAYOR ha sido tapeado")
		
	}
	
	// minor button
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
		//self.majorButton.backgroundColor = .white
		// test
		print("el botón MENOR ha sido tapeado")
		
	}
	
	@IBAction func openOptionsView(_ sender: UIButton) {
		
		// abre la vista para ver diversas opciones
		//self.optionsView.isHidden = false
		
		
//		// configura la animación de las constraints ligadas al menú
//		UIView.animate(
//			withDuration: 0.33,
//			delay: 0.0,
//			options: .curveEaseIn,
//			animations: {
//				let angle: CGFloat =
//					self.menuIsOpen ? .pi / 4 : 0.0
//				self.buttonMenu.transform = CGAffineTransform(rotationAngle: angle)
//				self.view.layoutIfNeeded() // !!!
//		},
//			completion: nil
//		)
		
		// configura la animación de las constraints ligadas al menú
//		UIView.animate(
//			withDuration: 0.33,
//			delay: 0.0,
//			options: .curveEaseIn,
//			animations: {
//				self.optionsView.frame.origin.y = +30
//		},
//			completion: nil
//		)
		
		
	}
	
	

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
