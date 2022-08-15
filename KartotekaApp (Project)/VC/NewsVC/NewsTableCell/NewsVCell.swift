//
//  NewsViewCell.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 28.06.22.
//

import UIKit

class NewsVCell: UITableViewCell {
    @IBOutlet private weak var imageViewOut: UIImageView!
    @IBOutlet private weak var textNewsOut: UILabel!
    
    func setForNewsCells(_ info: ModalNews) {
        imageViewOut.image = info.image
        textNewsOut.text = info.newsName
        setupForLabelScreenSize(textNewsOut)
    }
    
}
