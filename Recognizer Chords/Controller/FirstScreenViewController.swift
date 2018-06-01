//
//  FirstScreenViewController
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 21/05/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
La primer pantalla de la aplicación. Contiene dos botones representando un acorde mayor y un acorde menor más un botón de play.
*/

class FirstScreenViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	// información desplegada del menú
	let ci = ChordsInfo()
	
	// las barras
	let pointsBar = PointsBar()
	let errorsBar = ErrorsBar()
	
	// una variable que contiene la cantidad de veces que fue presionado el botón 'play'
	var counter: Counter = Counter()

	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************

	// los íconos de la barra de menú
	@IBOutlet weak var gClefButton: UIButton!
	@IBOutlet weak var settingsButton: UIButton!
	@IBOutlet weak var lastScoresButton: UIButton!
	@IBOutlet weak var headphonesButton: UIButton!
	
	// los tres botones que contiene esta pantalla
	@IBOutlet weak var majorButton: UIButton!
	@IBOutlet weak var playButton: UIButton!
	@IBOutlet weak var minorButton: UIButton!
	
	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
	
	// task: cargar la supervista..
    override func viewDidLoad() { // 🚪
        super.viewDidLoad()
		
		// en principio los botones de mayor y menor se encuentran deshabilitados
		majorButton.isEnabled = false
		minorButton.isEnabled = false
		
		view.addSubview(pointsBar)

		// añade ´autolayout´ a todas las vistas que contiene la pantalla
		autolayout()
	
    }
	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	

	
	@IBAction func gClefButtonPressed(_ sender: UIButton) {
		
//		majorButton.backgroundColor = .black
//		minorButton.backgroundColor = .black
		// emerge el rect que contiene información sobre los acordes
		ci.translatesAutoresizingMaskIntoConstraints = false
		ci.contenedorPrueba.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
		view.addSubview(ci.contenedorPrueba)
		ci.contenedorPrueba.isHidden = false
		
		playButton.alpha = 0.8
		majorButton.alpha = 0.8
		minorButton.alpha = 0.8

		

	}
	
	/// task: ejectutarse cada vez que el botón 'major' es tapeado
	@IBAction func majorButtonPressed(_ sender: UIButton) {
		
		// test 
		print("el botón de mayor fue presionado")
		
		// cuando el usuario tapea el botón mayor, el botón play vuelva a aparecer
		playButton.isHidden = false
		// el contador del botón play se pone a 0
		counter.playButtonValue = 0
		// se incrementa en 1 el valor del contador del botón mayor
		counter.incrementMajorButton()

		// test
		print("✏️\(counter.majorButtonValue)")

		
		if counter.majorButtonValue == 1 {
			// el botón de mayor al ser tapeado se deshabilita
			majorButton.isEnabled = false
			// el contador de este botón suma 1
			counter.majorButtonValue = 0
			// y el botón menor se deshabilita
			minorButton.isEnabled = false

		}
		
	}
	
	/// task: ejectutarse cada vez que el botón 'minor' es tapeado
	@IBAction func minorButtonPressed(_ sender: UIButton) {
		
		print("el botón de menor fue presionado")
		
		playButton.isHidden = false
		counter.playButtonValue = 0

		counter.incrementMinorButton()
		print("✏️\(counter.minorButtonValue)")
		// el botón de menor al ser tapeado se deshabilita
		if counter.minorButtonValue == 1 {
			counter.minorButtonValue = 0
			minorButton.isEnabled = false
			majorButton.isEnabled = false

		}

	}
	
	
	/// task: ejectutarse cada vez que el botón 'play' es tapeado
	@IBAction func playButtonPressed(_ sender: UIButton) {
		
		print("el botón de play fue presionado")
		
		// si el botón fue presionado 3 veces, desaparece
		
		// un contador que cuenta la cantidad de veces que fue presionado el botón 'play'
		
		counter.incrementPlayButton()
		print("✏️\(counter.playButtonValue)")
		
		majorButton.isEnabled = true
		minorButton.isEnabled = true
		
		if counter.playButtonValue == 3 {
			
			counter.playButtonValue = 0
			playButton.isHidden = true
			majorButton.isEnabled = true
			minorButton.isEnabled = true
		}
		
		
//		playButton.isHidden = true
		
	}
	
	//*****************************************************************
	// MARK: - Autolayout
	//*****************************************************************
	
	func autolayout () {
		
		
//		pointsBar.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 260), for: .vertical)
//		errorsBar.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 260), for: .vertical)
		
//		// rota el texto de los botones del menú
//		gClefButton.transform = CGAffineTransform(rotationAngle: -120)
//		settingsButton.transform = CGAffineTransform(rotationAngle: -120)
//		lastScoresButton.transform = CGAffineTransform(rotationAngle: -120)
//		headphonesButton.transform = CGAffineTransform(rotationAngle: -120)
		
		// translate autoresizing mask into constraints
		gClefButton.translatesAutoresizingMaskIntoConstraints = false
		settingsButton.translatesAutoresizingMaskIntoConstraints =  false
		lastScoresButton.translatesAutoresizingMaskIntoConstraints = false
		headphonesButton.translatesAutoresizingMaskIntoConstraints = false
		
		majorButton.translatesAutoresizingMaskIntoConstraints = false
		minorButton.translatesAutoresizingMaskIntoConstraints = false
		playButton.translatesAutoresizingMaskIntoConstraints = false
		
		pointsBar.translatesAutoresizingMaskIntoConstraints =  false
		
		
		// MARK: - Stack Views
		
		// definiendo los stack views
		
		// TOP
		let topStackView = UIStackView(arrangedSubviews: [gClefButton,  lastScoresButton, settingsButton, headphonesButton])
		
		// CENTER
		let centerStackView = UIStackView(arrangedSubviews: [majorButton, minorButton])
		
		// BOTTOM
		let bottomStackView = UIStackView(arrangedSubviews: [pointsBar, errorsBar])
		
		
		//////////////////////
		/// Top Stack View ///
		//////////////////////
		
		topStackView.translatesAutoresizingMaskIntoConstraints = false
		topStackView.axis = .horizontal
		topStackView.distribution = .equalCentering
		
		view.addSubview(topStackView)
		
		// restricciones a 'top stack view'
		NSLayoutConstraint.activate([
			topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			topStackView.heightAnchor.constraint(equalToConstant: 35)
			])
		
		
		/////////////////////////
		/// Center Stack View ///
		/////////////////////////
		
		centerStackView.translatesAutoresizingMaskIntoConstraints = false
		centerStackView.axis = .vertical
		centerStackView.distribution = .fillEqually
		
		view.addSubview(centerStackView)
		
		// restricciones a 'center stack view'
		NSLayoutConstraint.activate([
			centerStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor),
			centerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			centerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			//TODO: luego editar
			centerStackView.bottomAnchor.constraint(equalTo: centerStackView.topAnchor)
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
		override var prefersStatusBarHidden: Bool {
			return true
		}
		

} // end class


