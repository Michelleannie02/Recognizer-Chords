//
//  PruebaCV_ViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 19/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class PruebaCV_ViewController: UIViewController {
	
	
	var collectionData = ["uno", "dos", "tres"]
	
	
	@IBOutlet weak var collectionViewPrueba: UICollectionView!
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		collectionViewPrueba.backgroundColor = . yellow
		
		
		// collection view layout
		let width = view.frame.size.width
		let height = view.frame.size.height / 3.2
		let layout = collectionViewPrueba.collectionViewLayout as! UICollectionViewFlowLayout
		layout.itemSize = CGSize(width: width, height: height)
		
		
    }

	
	
}

extension PruebaCV_ViewController: UICollectionViewDataSource {
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return collectionData.count
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell id", for: indexPath)
		
		if let label = cell.viewWithTag(100) as? UILabel {
			label.text = collectionData[indexPath.row]
		}
		
		cell.backgroundColor = .red
		
		return cell
	}
	
	
	
	
	

}
