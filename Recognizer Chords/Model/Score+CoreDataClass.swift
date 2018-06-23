//
//  Score+CoreDataClass.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 23/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//
//

/* Model */

import Foundation
import CoreData


/* Abstract:
Una clase que representa el objeto ´Score´, con un inicializador de conveniencia.
*/

public class Score: NSManagedObject {
	
	/// task: crear un inicializador para generar las instancias de 'Score'
	// este inicializador tomará los datos de los aciertos obtenidos por el usuario
	convenience init(hits: Double, context: NSManagedObjectContext) {
		
		if let ent = NSEntityDescription.entity(forEntityName: "Score", in: context) {
	
			self.init(entity: ent, insertInto: context)
			self.hits = hits
			
		} else {
			
			fatalError("Unable To Find Entity Name!")
		}
	}
	
}

