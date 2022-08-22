//
//  ProfileVM.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 22.08.22.
//

import Foundation
import UIKit
protocol ProfileModelProtocol {
    func saveProfileSettings(_ name: UITextField, _ secondName: UITextField, _ token: UITextField, _ collection: [UITextField] )
    func changedProfileSettings(_ collection: [UITextField] )
}

final class ProfileModel: ProfileModelProtocol {
    
    func saveProfileSettings(_ name: UITextField, _ secondName: UITextField, _ token: UITextField, _ collection: [UITextField] ) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(name.text, forKey: Profile.ProfileKeys.kName)
        userDefaults.set(secondName.text, forKey: Profile.ProfileKeys.kSecondName)
        userDefaults.set(token.text, forKey: Profile.ProfileKeys.token)
        collection.forEach { element in
                element.textColor = .secondaryLabel
                element.isEnabled = false }
        
    }
    func changedProfileSettings(_ collection: [UITextField] ) {
        collection.forEach { element in
            element.textColor = .label
            element.isEnabled = true
        }
    }

}
