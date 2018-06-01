//
//  SecondScreenViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 4/16/18.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
TODO: completar
*/

class SecondScreenViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	let pointsBar = PointsBar()
	let errorsBar = ErrorsBar()
	

	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	/// menú superior ////////////////////////////////////////////////
	
	// los íconos de la barra de menú
	@IBOutlet weak var gClefButton: UIButton!
	@IBOutlet weak var settingsButton: UIButton!
	@IBOutlet weak var lastScoresButton: UIButton!
	@IBOutlet weak var headphonesButton: UIButton!
	
	/// información desplegada del menú
	@IBOutlet weak var fourChordInfo: UICollectionView!
	@IBOutlet weak var settings: UITableView!
	@IBOutlet weak var lastScores: UIStackView!
	@IBOutlet weak var headphones: UIStackView!
	
	/// botones ////////////////////////////////////////////////
	
	// los cinco botones que contiene esta pantalla
	@IBOutlet weak var majorButton: UIButton!
	@IBOutlet weak var minorButton: UIButton!
	@IBOutlet weak var playButton: UIButton!
	@IBOutlet weak var diminishedButton: UIButton!
	@IBOutlet weak var augmentedButton: UIButton!
	
	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
	
	// task: cargar la supervista..
	override func viewDidLoad() { // 🚪
		super.viewDidLoad()
		
		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		autolayout()
		
	}
	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		print("el botón de mayor fue presionado")
	
	}
	
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
		print("el botón de menor fue presionado")

	}
	
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		print("el botón de play fue presionado")

	}
	
	@IBAction func diminishedButtonPressed(_ sender: UIButton) {
		
		print("el botón de disminuído fue presionado")

	}
	
	@IBAction func augmentedButtonPressed(_ sender: UIButton) {
		
		print("el botón de aumentado fue presionado")

	}
	
	
	//*****************************************************************
	// MARK: - Autolayout
	//*****************************************************************
	
		func autolayout () {
			
//			// rota el texto de los botones del menú superior
//			gClefButton.transform = CGAffineTransform(rotationAngle: -120)
//			settingsButton.transform = CGAffineTransform(rotationAngle: -120)
//			lastScoresButton.transform = CGAffineTransform(rotationAngle: -120)
//			headphonesButton.transform = CGAffineTransform(rotationAngle: -120)
			
			// translate autoresizing mask into constraints
			
			// botones del menú superior
			gClefButton.translatesAutoresizingMaskIntoConstraints = false
			settingsButton.translatesAutoresizingMaskIntoConstraints = false
			lastScoresButton.translatesAutoresizingMaskIntoConstraints = false
			headphonesButton.translatesAutoresizingMaskIntoConstraints = false
			
			// botones de la interfaz
			majorButton.translatesAutoresizingMaskIntoConstraints = false
			minorButton.translatesAutoresizingMaskIntoConstraints = false
			augmentedButton.translatesAutoresizingMaskIntoConstraints = false
			diminishedButton.translatesAutoresizingMaskIntoConstraints = false
			playButton.translatesAutoresizingMaskIntoConstraints = false
			
			
			// MARK: - Stack Views
			
			// definiendo los stack views
			
			
			
			// TOP ////////////////////////////////////////////////////////////////
			let topStackView = UIStackView(arrangedSubviews: [gClefButton, lastScoresButton, settingsButton, headphonesButton])
			
			
			// CENTER //////////////////////////////////////////////////////////////
			
			// center-top
			let centerTopStackView = UIStackView(arrangedSubviews: [majorButton, diminishedButton])
			
			// center-bottom
			let centerBottomStackView = UIStackView(arrangedSubviews: [augmentedButton, minorButton])
			
			let centerStackView = UIStackView(arrangedSubviews: [centerTopStackView, centerBottomStackView])
			
			// BOTTOM //////////////////////////////////////////////////////////////
			let bottomStackView = UIStackView(arrangedSubviews: [pointsBar, errorsBar])
			
			
			//////////////////////
			/// Top Stack View ///
			//////////////////////
			
			topStackView.translatesAutoresizingMaskIntoConstraints = false
			topStackView.axis = .horizontal
			topStackView.distribution = .fillEqually
			
			view.addSubview(topStackView)
			
			// restricciones a 'top stack view'
			NSLayoutConstraint.activate([
				// ancla 'topStackView' con el tope de la supervista
				topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
				// ancla 'topStackView' con el lado izquierdo de la supervista
				topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
				// ancla 'topStackView' con el lado derecho de la supervista
				topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
				// ancla 'topStackView' con el fondo de la supervista
				topStackView.heightAnchor.constraint(equalToConstant: 35)
				])
			
			
			/////////////////////////
			/// Center Stack View ///
			/////////////////////////
			
			// center (root) 👈
			centerStackView.translatesAutoresizingMaskIntoConstraints = false
			centerStackView.axis = .vertical
			centerStackView.distribution = .fillEqually
			
			view.addSubview(centerStackView)
			
			// restricciones a 'center stack view'
			NSLayoutConstraint.activate([
				// ancla 'topStackView' con el tope de la supervista
				centerStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
				// ancla 'topStackView' con el lado izquierdo de la supervista
				centerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
				// ancla 'topStackView' con el lado derecho de la supervista
				centerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
				// ancla 'topStackView' con el fondo de la supervista
				centerStackView.bottomAnchor.constraint(equalTo: centerStackView.topAnchor)
				])
			
			// (center-top)
			centerTopStackView.translatesAutoresizingMaskIntoConstraints = false
			centerTopStackView.axis = .horizontal
			centerTopStackView.distribution = .fillEqually
			
			view.addSubview(centerTopStackView)
			
			// restricciones a 'top center stack view'
			NSLayoutConstraint.activate([
			// ancla 'topStackView' con el tope de la supervista
			centerTopStackView.topAnchor.constraint(equalTo:centerStackView.topAnchor),
			// ancla 'topStackView' con el lado izquierdo de la supervista
			centerTopStackView.leadingAnchor.constraint(equalTo: centerStackView.leadingAnchor),
			// ancla 'topStackView' con el lado derecho de la supervista
			centerTopStackView.trailingAnchor.constraint(equalTo: centerStackView.trailingAnchor),
			// ancla 'topStackView' con el fondo de la supervista
			centerTopStackView.bottomAnchor.constraint(equalTo: view.centerYAnchor)
			])
			
			// (center-bottom)
			centerBottomStackView.translatesAutoresizingMaskIntoConstraints = false
			centerBottomStackView.axis = .horizontal
			centerBottomStackView.distribution = .fillEqually
			
			view.addSubview(centerBottomStackView)
			
			// restricciones a 'top center stack view'
			NSLayoutConstraint.activate([
				// ancla 'topStackView' con el tope de la supervista
				centerBottomStackView.topAnchor.constraint(equalTo: view.centerYAnchor),
				// ancla 'topStackView' con el lado izquierdo de la supervista
				centerBottomStackView.leadingAnchor.constraint(equalTo: centerStackView.leadingAnchor),
				// ancla 'topStackView' con el lado derecho de la supervista
				centerBottomStackView.trailingAnchor.constraint(equalTo: centerStackView.trailingAnchor),
				// ancla 'topStackView' con el fondo de la supervista
				centerBottomStackView.bottomAnchor.constraint(equalTo: centerStackView.bottomAnchor)
				])
		
			
			/////////////////////////
			/// Bottom Stack View ///
			/////////////////////////

			bottomStackView.translatesAutoresizingMaskIntoConstraints = false
			bottomStackView.axis = .horizontal
			bottomStackView.distribution = .fillEqually

			
			view.addSubview(bottomStackView)
			
			// restricciones a 'bottom stack view'
			NSLayoutConstraint.activate([
				bottomStackView.topAnchor.constraint(equalTo: centerStackView.bottomAnchor),
				bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
				bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
				bottomStackView.heightAnchor.constraint(equalToConstant: 50),
				bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
				])
			

			///////////////////
			/// Play Button ///
			///////////////////
			
			view.addSubview(playButton)
			NSLayoutConstraint.activate([
				// ancla 'play button' en el centro de la pantalla
				playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
				playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
				])

	}
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
		
		/// esconde la barra de estado
		override var prefersStatusBarHidden: Bool { return true }
	
} // end class





