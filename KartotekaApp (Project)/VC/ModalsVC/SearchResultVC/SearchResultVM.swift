//
//  SearchResultVM.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 22.08.22.
//

import Foundation

protocol SearchProtocol {
    var update: (() -> Void)? { get set }
    var infoEgrArray: [EgrResponse] { get }
    func loadInfo()
}

    
final class SearchResultVM: SearchProtocol {
        
        let networkService = NetworkService()
        var update: (() -> Void)?
        var infoEgrArray: [EgrResponse] = [] {
        didSet { update?() }
    }
        func loadInfo() {
            networkService.loadInfo { complition in
                    switch complition {
                    case .success(let inf):
                        self.infoEgrArray.append(inf)
                    case .failure(_):
                        do { self.update?() }
                    case .outOfStock:
                        do { self.update?() }
                    }
                }
            }
    }
    
    

