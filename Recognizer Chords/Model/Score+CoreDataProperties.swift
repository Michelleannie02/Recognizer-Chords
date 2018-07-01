//
//  Score+CoreDataProperties.swift
//  Recognizer Chords
//
//  Created by Luciano Schillagi on 25/06/2018.
//  Copyright © 2018 luko. All rights reserved.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var hits: Double
}
