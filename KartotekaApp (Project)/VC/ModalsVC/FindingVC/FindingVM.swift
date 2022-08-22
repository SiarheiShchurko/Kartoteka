//
//  FindingVM.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 22.08.22.
//

import Foundation

protocol FindingVMProtocol {
    
    var arrayInfo: [FullResponse] { get }
    
    func loadInfo()
    
    var update: (() -> Void)? { get set }
    
}

final class FindingVM: FindingVMProtocol {
    
    var update: (() -> Void)?
    
    let networkServiceFind = NetworkServiceFind()
    
    var arrayInfo: [FullResponse] = [] {
        didSet { update?() }
    }
    
    func loadInfo() {
        networkServiceFind.loadInfo { complition in
            self.arrayInfo.append(complition)
        }
    }
}
