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
	
	
	// View //
	
	// la barra del menú superior
//	let menuBar: UICollectionView = {
//		
//		let frame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100)
//		let mb = UICollectionView(frame: frame)
//		mb.backgroundColor = .red
//		
//		return mb
//		
//	}()


	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
	
	// view controller methods
	
	/// task: ejecutar luego cargar la supervista
	override func viewDidLoad() {
		super.viewDidLoad()
		

		
		// llama al configurador de la vista 'two chords'
//		setupTwoChords()
		
		print("view did load")
		
		view.backgroundColor = .brown
	
	}
	
	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: configurar la vista 'two chords'
	private func setupTwoChords() {
		
		// agrega la vista 'two chords'
		//view.addSubview(twoChords)
//		// agrega una restricción horizontal
//		view.addConstraintsWithFormat(format: "H:|[v0]|", views: twoChords)
//		// agrega una restricción vertical
//		view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: twoChords)
		
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


	

