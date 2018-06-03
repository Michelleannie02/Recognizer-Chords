//
//  LayerViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 03/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//

import UIKit

class LayerViewController: UIViewController {
	
	let pruebaLayer = PointsView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		view.addSubview(pruebaLayer)
    }



}
