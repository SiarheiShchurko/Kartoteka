//
//  CountrysVCell.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 26.06.22.
//

import UIKit

class CountrysVCell: UITableViewCell {
    
    //MARK: Label name country
    @IBOutlet private weak var countryNameOut: UILabel!
    
  
    //MARK: Func for set label in cells
    func setupCell(_ set: Settings) {
        countryNameOut.text = set.countryChanged
        
    }

}
