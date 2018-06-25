//
//  Score+CoreDataProperties.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 23/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//
//

import Foundation
import CoreData

/* Abstract:
Contiene un método para buscar las objetos 'Score' dentro del contexto y el atributo 'hits' de la entidad 'Score'.
*/

extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var hits: Double // attribute

}
