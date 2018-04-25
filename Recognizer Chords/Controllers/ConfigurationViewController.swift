//
//  ConfigurationViewController.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 19/04/2018.
//  Copyright © 2018 luko. All rights reserved.
//

/* Controller */

import UIKit

/* Abstract:
TODO: completar...
*/

class ConfigurationViewController: UIViewController {
	
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
	
	// una vista de tabla
	@IBOutlet weak var tableView: UITableView!
	
	
	//*****************************************************************
	// MARK: - Life Cycle
	//*****************************************************************
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


	//*****************************************************************
	// MARK: - IBActions
	//*****************************************************************
	
	
	

}
