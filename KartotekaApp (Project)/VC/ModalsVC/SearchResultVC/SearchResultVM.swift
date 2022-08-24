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
    
    //MARK: Buffer var for timer sec
    var counter: Int = 0
    
    //MARK: Func call if user enter miss unp or token
    var checkError: SearchResultVC?
    
    let networkService = NetworkService()
    
    //MARK: No connect func
    var noConnect: (() -> Void)?
    
    //MARK: Func for reload data, and work other UI
    var update: (() -> Void)?
    
    //MARK: Array for stored get data
    var infoEgrArray: [EgrResponse] = [] {
        didSet { update?() }
    }
    
    //MARK: Load data in array
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
    
    //MARK: Timer func
    func timerFunc() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    //MARK: Update timer evry 1 sec. If timesr = 10 sec - timer.invalidate
    @objc func timerCounter() {
        if counter < 10 {
            counter += 1
        } else {
            do { self.noConnect?() }
            timer?.invalidate()
        }
    }
}
    
    

