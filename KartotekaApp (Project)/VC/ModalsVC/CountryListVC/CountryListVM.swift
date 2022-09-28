//
//  File.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 22.08.22.
//

import Foundation

//MARK: Protocol for VM
protocol CountryListProtocol {
    
    var countrysArray: [ String ] { get }
    
}

final class CountryListVM: CountryListProtocol {
    
    //MARK: Keep selected country enum
    enum KeysForDefaults {
        
        static var selectedCountry = ""
        
    }
//MARK: Array countrys which
   var countrysArray: [String] = ["Беларусь", "Россия", "Украина", "Казахстан"]
}
