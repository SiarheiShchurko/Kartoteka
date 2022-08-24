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
    
    func timerFunc()
    
    var update: (() -> Void)? { get set }
    
    var noConnect: (() -> Void)? { get set }
    
}

final class FindingVM: FindingVMProtocol {
    
    let networkServiceFind = NetworkServiceFind()
    
    var timer: Timer?
    
    //MARK: Buffer var for timer sec
    var counter: Int = 0
    
    //MARK: Func for reload data, and work other UI
    var update: (() -> Void)?
    
    //MARK: No connect func
    var noConnect: (() -> Void)?
    
    //MARK: Array for stored get data
    var arrayInfo: [FullResponse] = [] {
        didSet { update?() }
    }
    
    //MARK: Load data in array
    func loadInfo() {
        networkServiceFind.loadInfo { complition in
            self.arrayInfo.append(complition)
            self.timer?.invalidate()
        }
    }
    
    //MARK: Timer func
    func timerFunc() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    //MARK: Update timer evry 1 sec. If timesr = 10 sec - timer.invalidate
    @objc private func updateTimer() {
        if counter < 10 {
            counter += 1
        } else {
            do { self.noConnect?() }
                timer?.invalidate()
        }
    }
    
}
