//
//  ProfileModel.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 15.07.22.
//

import Foundation
import UIKit

struct Profile {
    var name: String?
    var secondName: String?
    var token: String? 
    
    enum ProfileKeys: CodingKey {
        static let kName = "name"
        static let kSecondName = "secondName"
        static let token = "token"
    }
}
