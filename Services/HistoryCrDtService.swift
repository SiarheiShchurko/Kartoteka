//
//  HistoryCrDtService.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 8.08.22.
//

import Foundation
import CoreData

    final class HistoryCrDtService {
        
        static var mainContext: NSManagedObjectContext {
            return persistentContainer.viewContext
        }
        
        // MARK: - Core Data stack
        
       static var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "HistoryVisualsCrDt")
            container.loadPersistentStores(completionHandler: {( NSPersistentStoreDescription, error ) in
                if let error1 = error as NSError? {
                    fatalError("Unresolved error \(error1),\(error1.userInfo)")
                }
            })
                    return container
        }()

        //MARK: - Core Data Saving support

       static func saveContext () {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror),\(nserror.userInfo)")
                }
            }
        }
        
        //MARK: - Method save information in  Data Base
      static func saveDataBaseMethod(_ inf: EgrResponse) {
          HistoryCrDtService.mainContext.perform {
            //MARK - name for new object
              let request = History.fetchRequest()
              if let fullDataArray = try? HistoryCrDtService.mainContext.fetch(request).self {
                  
                  let client = History(context: HistoryCrDtService.mainContext)
                  client.name = optionalRemoveForIntStr(inf.data.first?.name)
                  client.unp = optionalRemoveForIntStr(inf.data.first?.unp)
                  client.date = Date.init()
                      fullDataArray.forEach { item in
                          if inf.data.first?.unp == nil {
                              HistoryCrDtService.mainContext.delete(client)
                              saveContext()
                          } else if client.unp == item.unp {
                              HistoryCrDtService.mainContext.delete(item)
                              saveContext()
                          } else {
                              saveContext()
                          }
                          }
                      }
                  }
              }
    }
    
    

