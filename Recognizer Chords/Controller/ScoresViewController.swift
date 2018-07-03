//
//  ScoresViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 19/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit
import CoreData

/* Abstract:
Una pantalla que muestra los últimos TRES scores del usuario.
*/

class ScoresViewController: UIViewController {
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************
	
	/// Core Data .....................................................
	var dataController: DataController! // inyecta el controlador de datos (core data stack)

	/// User Score ....................................................
	// todos los scores del usuario persistidos
	var scores: [Score] = []
	var scoresReversed: [Score] = []

	// los últimos tres scores del usuario
	var threeLastScores: [Score] = []
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet weak var closeButton: UIButton!
	@IBOutlet weak var threeLastScoresCollectionView: UICollectionView!
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// comprueba si hay scores persistidos 👈
		fetchRequestForScores()
		
		// collection view layout
		collectionViewLayout()
	}
	
	
	//*****************************************************************
	// MARK: - Core Data (fetch request)
	//*****************************************************************
	
	/// task: buscar si hay objetos 'Score' persistidos
	func fetchRequestForScores() {

			// hay objetos 'Score' persistidos?
			let fetchRequest: NSFetchRequest<Score> = Score.fetchRequest() // 🔍

				// comprueba si hay resultados en la búsqueda..
				if let result = try? dataController.viewContext.fetch(fetchRequest) {

					// .. si es así, asigna el resultado de la solicitud al array de scores persistidos
					scores = result // scores:[Score] 🔌

				}

			onlyThreeLastScores()

		}
	

	/// task: filtrar, del array de scores, sólo los 3 primeros miembros 👏
	func onlyThreeLastScores() {
		scoresReversed = scores.reversed()
		threeLastScores = scoresReversed.getFirstElements(upTo: 3)
		debugPrint("tus últimos tres scores son \(threeLastScores)")
	}

	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	/// task: despedir la pantalla de scores
	@IBAction func closeScores(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}
	
	
	//*****************************************************************
	// MARK: - Helpers
	//*****************************************************************
	
	/// esconde la barra de estado
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
}

	//*****************************************************************
	// MARK: - Collection View Methods
	//*****************************************************************

	extension ScoresViewController: UICollectionViewDataSource {
		
		func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
			return threeLastScores.count
		}
		
		func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			
			// la celda de scores
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "score cell id", for: indexPath)
			
			// pone la etiqueta contenida en la celda de color verde
			//cell.pointsEarned.backgroundColor = .green
			
			cell.backgroundColor = .red
			
			// itera el array de scores para extraerle los valores de 'hits'
			var hitsArray: [Int] = []
			for score in scoresReversed {
				hitsArray.append(Int(score.hits))
			}
			// pone los valores de hits en la etiqueta de la celda de la colección
			if let label = cell.viewWithTag(100) as? UILabel {
				label.text = String(hitsArray[indexPath.row])
			}
			
			// devuelve la celda ya configurada
			return cell
		}
	
		
//		func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//			<#code#>
//		}
		
		func collectionViewLayout() {
			threeLastScoresCollectionView.backgroundColor = .red
			let width = (view.frame.size.width) - 20
			let height = (view.frame.size.height - 70) / 3.45
			let layout = threeLastScoresCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
			layout.itemSize = CGSize(width: width, height: height)
		}

	
} // end ext










	
	
	
	

	
	
	
	
	
	








