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
    
    var timer: Timer?
    var counter: Int = 0
    var update: (() -> Void)?
    var noConnect: (() -> Void)?
    let networkServiceFind = NetworkServiceFind()
    
    var arrayInfo: [FullResponse] = [] {
        didSet { update?() }
    }
    
    func loadInfo() {
        networkServiceFind.loadInfo { complition in
            self.arrayInfo.append(complition)
            self.timer?.invalidate()
        }
    }
    
    func timerFunc() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        if counter < 10 {
            counter += 1
        } else {
            do { self.noConnect?() }
                timer?.invalidate()
        }
    }
    
}
