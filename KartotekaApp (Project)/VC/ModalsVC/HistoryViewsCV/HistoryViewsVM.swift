//
//  HistoryVM.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 23.08.22.
//

import Foundation
import UIKit
protocol HistoryViewsProtocol {
    var client: [History] { get set }
    var filtredClient: [History] { get set }
    var update: (() -> Void)? { get set }
    func showClients()
}

final class HistoryVM: HistoryViewsProtocol {
    
    //MARK: Client array
    
    var client: [History] = []
    
    var filtredClient: [History] = []
    
    var update: (() -> Void)?
    
    //MARK: func Sort list clients in DataBase
    func showClients() {
         let request = History.fetchRequest()
         request.sortDescriptors = [NSSortDescriptor(key: #keyPath(History.date), ascending: false)]
         let client = try? HistoryCrDtService.mainContext.fetch(request)
         self.client = client ?? []
         self.update?()
     }
}
