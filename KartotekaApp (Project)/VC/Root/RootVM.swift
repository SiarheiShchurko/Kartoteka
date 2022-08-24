//
//  RootVM.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 12.08.22.
//

import Foundation

//MARK: Protocol for VM
protocol RootProtokol {
    
    static var unp: Int? { get set }
    
}


class RootVM: RootProtokol {
    
    static var unp: Int?

}
