//
//  ScoresViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 19/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
...
*/

class ScoresViewController: UIViewController {
	
	
	//*****************************************************************
	// MARK: - Properties
	//*****************************************************************

	var collectionData = ["3", "4", "2"]
	
	//*****************************************************************
	// MARK: - IBOutlets
	//*****************************************************************
	
	@IBOutlet weak var closeButton: UIButton!
	@IBOutlet weak var threeLastScores: UICollectionView!
	
	
	
	//*****************************************************************
	// MARK: - VC Life Cycle
	//*****************************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		// collection view layout
		collectionViewLayout()
		
	}
	
	
	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	/// task: despedir la pantalla de scores
	@IBAction func closeScores(_ sender: UIButton) {
		
		dismiss(animated: true, completion: nil)
		
		
	}
	
}


	//*****************************************************************
	// MARK: - Collection View Methods
	//*****************************************************************

	extension ScoresViewController: UICollectionViewDataSource {
		
		func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
			
			return collectionData.count
		}
		
		func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			
			
			// la celda de scores
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "score cell id", for: indexPath)
			
			// pone la etiqueta contenida en la celda de color verde
			//cell.pointsEarned.backgroundColor = .green
			
			cell.backgroundColor = .gray
			
			print("😉 la celda devuelta: \(cell)")
			
			if let label = cell.viewWithTag(100) as? UILabel {
				label.text = collectionData[indexPath.row]
			}
			
			// devuelve la celda ya configurada
			return cell
		}
	
		
//		func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//			<#code#>
//		}
		
		func collectionViewLayout() {
			
			// 3 last scores collection view layout
			
			print("🛡 se cargó la vista de scores")
			threeLastScores.backgroundColor = .red
			
			
			// collection view layout
			let width = (view.frame.size.width) - 20
			let height = (view.frame.size.height - 70) / 3.45
			let layout = threeLastScores.collectionViewLayout as! UICollectionViewFlowLayout
			layout.itemSize = CGSize(width: width, height: height)
			
			
		}

	
} // end ext










	
	
	
	

	
	
	
	
	
	








