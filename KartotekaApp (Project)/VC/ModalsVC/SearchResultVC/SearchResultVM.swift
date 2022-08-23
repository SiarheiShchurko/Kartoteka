//
//  SearchResultVM.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 22.08.22.
//

import Foundation

protocol SearchProtocol {
    var update: (() -> Void)? { get set }
    var noConnect: (() -> Void)? { get set }
    var infoEgrArray: [EgrResponse] { get }
    func timerFunc()
    func loadInfo()
}

    
final class SearchResultVM: SearchProtocol {
    var timer: Timer?
    var counter: Int = 0
    
    var checkError: SearchResultVC?
    let networkService = NetworkService()
    var noConnect: (() -> Void)?
    var update: (() -> Void)?
    var infoEgrArray: [EgrResponse] = [] {
        didSet { update?() }
    }
    func loadInfo() {
        networkService.loadInfo { [self] complition in
            switch complition {
            case .success(let inf):
                self.infoEgrArray.append(inf)
                timer?.invalidate()
            default: break
            }
        }
    }
    
    func timerFunc() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @objc func timerCounter() {
        if counter < 10 {
            counter += 1
        } else {
            do { self.noConnect?() }
            timer?.invalidate()
        }
    }
}
    
    

