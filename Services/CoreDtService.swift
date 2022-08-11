//
//  CoreDtService.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 3.08.22.
//

import Foundation
import CoreData

//final class CoreDtService {
//    static var mainContextq: NSManagedObjectContext {
//        return persistentContainer.viewContext
//    }
//    
//    // MARK: - Core Data stack
//    
//   static var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "CrDtModel")
//        container.loadPersistentStores(completionHandler: {( NSPersistentStoreDescription, error ) in
//            if let error1 = error as NSError? {
//                fatalError("Unresolved error \(error1),\(error1.userInfo)")
//            }
//        })
//                return container
//    }()
//
//    //MARK: - Core Data Saving support
//
//   static func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror),\(nserror.userInfo)")
//            }
//        }
//    }
//    
//    //MARK: - Method save information in  Data Base
//  static func saveDataBaseMethod(_ inf: EgrResponse) {
//    CoreDtService.mainContextq.perform {
//        //MARK - name for new object
//       
//        //MARK - request for get fullDataArray
//        let request = Client.fetchRequest()
//        if let fullDataArray = try? CoreDtService.mainContextq.fetch(request).self {
//            let client = Client(context: CoreDtService.mainContextq)
//            client.name = optionalRemoveForIntStr(inf.data.first?.name)
//            client.unp = optionalRemoveForIntStr(inf.data.first?.unp)
//                fullDataArray.forEach { item in
//                    let iUnp = item.unp
//                    let cUnp = client.unp
//                    if iUnp == cUnp {
//                        CoreDtService.mainContextq.delete(client)
//                        saveContext()
//                    } else if ((cUnp?.isEmpty) == nil) {
//                        CoreDtService.mainContextq.delete(client)
//                        saveContext()
//                    } else {
//                        saveContext()
//                    }
//                    }
//                }
//            }
//        }
//        
//        //MARK - checking (if unp nil or Data contain same object - delete this is element )
//            
//        }
//    
    





