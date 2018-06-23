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
	
	/// CORE DATA /////////////////////////////////////////////////////////////
	var dataController: DataController! // inyecta el controlador de datos (core data stack)
	
	// los scores del usuario persistidos
	var scores: [Score] = []

	
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
		
		// core data
		fetchRequestForScores()
		
		// collection view layout
		collectionViewLayout()
		
		
	}
	
	
	//*****************************************************************
	// MARK: - Core Data (fetch request)
	//*****************************************************************
	
	/// task: buscar si hay objetos 'Score' persistidos
	func fetchRequestForScores() {
		
//				// hay objetos 'Score' persistidos?
//				let fetchRequest: NSFetchRequest<Score> = Score.fetchRequest() // 🔍
//		
//				// comprueba si hay resultados en la búsqueda..
//				if let result = try? dataController.viewContext.fetch(fetchRequest) {
//		
//					// .. si es así, asigna el resultado de la solicitud al array de pins persistidos
//					pins = result // pins:[Pin] 🔌
//				}
//		
//				// luego itera ese array pins
//				for pin in pins { //
//					// y a las coordenadas de los pins persistidos..
//					let coordinate = CLLocationCoordinate2D(latitude: pin.latitude , longitude: pin.longitude )
//					// las convierte en objetos que adoptan el protocolo 'MKAnnotation'
//					let pins = PinOnMap(coordinate: coordinate)
//					// y los agrega al array de objetos preparados para mostrarse en una vista de mapa
//					pinsOnMap.append(pins)
//				}
//		
//				// por último, actualiza la vista de mapa agregando los pins persistidos.
//				mapView.addAnnotations(pinsOnMap)
		
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
			
			return 3
		}
		
		func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			
			
			// la celda de scores
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "score cell id", for: indexPath)
			
			// pone la etiqueta contenida en la celda de color verde
			//cell.pointsEarned.backgroundColor = .green
			
			cell.backgroundColor = .gray
			
			print("😉 la celda devuelta: \(cell)")
			
			if let label = cell.viewWithTag(100) as? UILabel {
				//label.text = collectionData[indexPath.row]
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










	
	
	
	

	
	
	
	
	
	








