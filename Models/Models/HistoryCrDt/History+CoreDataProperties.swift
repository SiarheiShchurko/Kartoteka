//
//  History+CoreDataProperties.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 8.08.22.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var unp: String?

}

extension History : Identifiable {

}
