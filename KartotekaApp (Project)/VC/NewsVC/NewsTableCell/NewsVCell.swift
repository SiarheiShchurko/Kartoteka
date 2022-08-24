//
//  NewsViewCell.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 28.06.22.
//

import UIKit

class NewsVCell: UITableViewCell {
    //MARK: - Labels for cells
    @IBOutlet private weak var imageViewOut: UIImageView!
    @IBOutlet private weak var textNewsOut: UILabel!
    
    //MARK: - Method for set labels 
    func setForNewsCells(_ info: ModalNews) {
        imageViewOut.image = info.image
        textNewsOut.text = info.newsName
        setupForLabelScreenSize(textNewsOut)
    }
    
}
