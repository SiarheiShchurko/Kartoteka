//
//  Client+CoreDataProperties.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 2.08.22.
//
//

import Foundation
import CoreData


extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client")
    }

    @NSManaged public var name: String?
    @NSManaged public var unp: String?

}

extension Client : Identifiable {

}

