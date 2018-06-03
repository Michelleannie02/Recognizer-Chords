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
	
	// información desplegada del menú
	let ci = ChordsInfo()
	
	let pointsBar = PointsBar()
	let errorsBar = ErrorsBar()
	
	// una variable que contiene la cantidad de veces que fue presionado el botón 'play'
	var counter: Counter = Counter()
	
	// lenguaje actual
	var englishLanguage = true
	
	// los botones de acordes fueron tapeados
	var majorButtonWasTapped = true
	var minorButtonWasTapped = true
	var diminishedButtonWasTapped = true
	var augmentedButtonWasTapped = true
	
	var elBotonFuePresionado = true


	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	/// menú superior ////////////////////////////////////////////////
	
	// los íconos de la barra de menú
	@IBOutlet weak var gClefButton: UIButton!
	@IBOutlet weak var lastScoresButton: UIButton!
	@IBOutlet weak var languageButton: UIButton!
	
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
		
		// las contenedores con información acerca de acordes y puntaje también
		ci.isHidden = true
		
		disabledButtons()
		
		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		autolayout()
		
	}
	

	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	@IBAction func chordsInfoButtonPressed(_ sender: UIButton) {
		
		print("🤼‍♀️ El boton fue presionado está en \(elBotonFuePresionado)")
		
		// el área aparece
		if elBotonFuePresionado {
			ci.isHidden = false
			elBotonFuePresionado = false
			
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			playButton.isEnabled = false
			
			// el área desaparece
		} else {
			ci.isHidden = true
			elBotonFuePresionado = true
			
			majorButton.isEnabled = true
			minorButton.isEnabled = true
			playButton.isEnabled = true
		}

	}
	
	@IBAction func scoresButtonPressed(_ sender: UIButton) {
		
		print("🤼‍♀️ El boton fue presionado está en \(elBotonFuePresionado)")
		
		// el área aparece
		if elBotonFuePresionado {
			ci.isHidden = false
			elBotonFuePresionado = false
			
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			playButton.isEnabled = false
			
			// el área desaparece
		} else {
			ci.isHidden = true
			elBotonFuePresionado = true
			
			majorButton.isEnabled = true
			minorButton.isEnabled = true
			playButton.isEnabled = true
		}
		
	}
	
	/// task: ejectutarse cada vez que el botón 'language' es tapeado
	@IBAction func languageButtonPressed(_ sender: UIButton) {
		
		// si el lenguaje actual está en inglés, cambiar a español
		if englishLanguage {
			languageButton.setTitle("EN", for: .normal)
			englishLanguage = false
			print("ahora la app está en español")
			// si está en español, cambiar a inglés
		} else {
			languageButton.setTitle("ES", for: .normal)
			print("ahora la app está en inglés")
			englishLanguage = true
		}
		
	}
	

	/// task: ejectutarse cada vez que el botón 'major' es tapeado
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón de mayor fue presionado")
		
		// cuando el usuario tapea el botón mayor, el botón play vuelva a aparecer
		playButton.isHidden = false
		playButton.alpha = 1
		
		
		// se ejecuta como estado inicial
		// y cada vez que el botón mayor es tapeado
		if majorButtonWasTapped {
			// deshabilita todos los botones de acordes
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
			
		}
		
		// el contador del botón play se pone a 0
		counter.playButtonValue = 0
	
	}
	
	/// task: ejectutarse cada vez que el botón 'minor' es tapeado
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
		print("el botón de menor fue presionado")
		
		
		playButton.isHidden = false
		playButton.alpha = 1

		
		if minorButtonWasTapped {
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
			
		}
		
		counter.playButtonValue = 0

	}
	
	
	/// task: ejectutarse cada vez que el botón 'disminuído' es tapeado
	@IBAction func diminishedButtonPressed(_ sender: UIButton) {
		
		// test
		print("el botón de disminuído fue presionado")
		
		// cuando el usuario tapea el botón disminuído, el botón play vuelve a aparecer
		playButton.isHidden = false
		playButton.alpha = 1

		
		
		if diminishedButtonWasTapped {
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
		}
		
		// el contador del botón play se pone a 0
		counter.playButtonValue = 0

	}
	
	/// task: ejectutarse cada vez que el botón 'aumentado' es tapeado
	@IBAction func augmentedButtonPressed(_ sender: UIButton) {
		
		print("el botón de aumentado fue presionado")
		
		// cuando el usuario tapea el botón disminuído, el botón play vuelve a aparecer
		playButton.isHidden = false
		playButton.alpha = 1

		
		// se ejecuta como estado inicial
		// y cada vez que el botón aumentado es tapeado
		if augmentedButtonWasTapped {
			// deshabilita todos los botones de acordes
			majorButton.isEnabled = false
			minorButton.isEnabled = false
			diminishedButton.isEnabled = false
			augmentedButton.isEnabled = false
			
		}
		
		// y el contador del botón play se pone a 0
		counter.playButtonValue = 0
		
	}
	
	
	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		print("el botón de play fue presionado")
		
		counter.incrementPlayButton()
		print("✏️\(counter.playButtonValue)")
		
		majorButton.isEnabled = true
		minorButton.isEnabled = true
		diminishedButton.isEnabled = true
		augmentedButton.isEnabled = true
		
		if counter.playButtonValue == 2 {
			
			playButton.alpha = 0.75
		}
		
		if counter.playButtonValue == 3 {
			
			counter.playButtonValue = 0
			playButton.isHidden = true
			majorButton.isEnabled = true
			minorButton.isEnabled = true
		}
		
	}

	//*****************************************************************
	// MARK: - Methods
	//*****************************************************************
	
	/// task: deshabilitar los botones de acordes
	func disabledButtons() {
		
		// en principio los botones de mayor, menor, disminuído y aumentado están deshabilitados
		majorButton.isEnabled = false
		minorButton.isEnabled = false
		augmentedButton.isEnabled = false
		diminishedButton.isEnabled = false

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
			lastScoresButton.translatesAutoresizingMaskIntoConstraints = false

			
			// botones de la interfaz
			majorButton.translatesAutoresizingMaskIntoConstraints = false
			minorButton.translatesAutoresizingMaskIntoConstraints = false
			augmentedButton.translatesAutoresizingMaskIntoConstraints = false
			diminishedButton.translatesAutoresizingMaskIntoConstraints = false
			playButton.translatesAutoresizingMaskIntoConstraints = false
			
			ci.translatesAutoresizingMaskIntoConstraints = false
			
			
			// MARK: - Stack Views
			
			// definiendo los stack views
			
			
			
			// TOP ////////////////////////////////////////////////////////////////
			let topStackView = UIStackView(arrangedSubviews: [gClefButton, lastScoresButton, languageButton])
			
			
			// CENTER //////////////////////////////////////////////////////////////
			
			// center-top
			let centerTopStackView = UIStackView(arrangedSubviews: [majorButton, diminishedButton])
			
			// center-bottom
			let centerBottomStackView = UIStackView(arrangedSubviews: [augmentedButton, minorButton])
			
			let centerStackView = UIStackView(arrangedSubviews: [centerTopStackView, centerBottomStackView])
			
			// BOTTOM //////////////////////////////////////////////////////////////
			let bottomStackView = UIStackView(arrangedSubviews: [pointsBar, errorsBar])
			
			// ANEXOS
			let chordsInfoStackView = UIStackView(arrangedSubviews: [ci])
			let lastScoresStackView = UIStackView(arrangedSubviews: [ci])
			
			
			//////////////////////
			/// Top Stack View ///
			//////////////////////
			
			topStackView.translatesAutoresizingMaskIntoConstraints = false
			topStackView.axis = .horizontal
			topStackView.distribution = .fillEqually
			topStackView.spacing = 150
			
			view.addSubview(topStackView)
			
			// restricciones a 'top stack view'
			NSLayoutConstraint.activate([
				topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
				topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
				topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
				topStackView.heightAnchor.constraint(equalToConstant: 10)
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
			
			///////////////////
			/// Chords Info ///
			///////////////////
			
			chordsInfoStackView.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview(chordsInfoStackView)
			// restricciones al contenedor de prueba
			NSLayoutConstraint.activate([
				// top
				chordsInfoStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
				// leading
				chordsInfoStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
				// trailing
				chordsInfoStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
				// height
				chordsInfoStackView.heightAnchor.constraint(equalToConstant: 250)
				
				])
			
			print("🥉\(chordsInfoStackView.arrangedSubviews.count)")
			
			///////////////////
			/// Scores Info ///
			///////////////////
			
			lastScoresStackView.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview(lastScoresStackView)
			// restricciones al contenedor de prueba
			NSLayoutConstraint.activate([
				// top
				lastScoresStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
				// leading
				lastScoresStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
				// trailing
				lastScoresStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
				// height
				lastScoresStackView.heightAnchor.constraint(equalToConstant: 250)
				
				])
			
			

	}
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
		
		/// esconde la barra de estado
		override var prefersStatusBarHidden: Bool { return true }
	
} // end class





