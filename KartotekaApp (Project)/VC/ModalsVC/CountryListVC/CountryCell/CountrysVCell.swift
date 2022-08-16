//
//  CountrysVCell.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 26.06.22.
//

import UIKit

class CountrysVCell: UITableViewCell {
    
    @IBOutlet private weak var countryNameOut: UILabel!
    
    var setting: Settings!
    
    func setupCell(_ set: Settings) {
        countryNameOut.text = set.countryChanged
        
    }

}
