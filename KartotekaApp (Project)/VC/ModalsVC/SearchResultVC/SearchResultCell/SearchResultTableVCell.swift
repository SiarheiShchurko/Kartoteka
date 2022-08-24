//
//  SearchResultTableVCell.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 6.07.22.
//

import UIKit

class SearchResultTableVCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var unpOut: UILabel!
    @IBOutlet private weak var nameOut: UILabel!
    @IBOutlet private weak var registrImnsOut: UILabel!
    @IBOutlet private weak var imnsNumberOut: UILabel!
    @IBOutlet private weak var addressOut: UILabel!
    @IBOutlet private weak var statusOut: UILabel!
    @IBOutlet private weak var regDateOut: UILabel!
    
    //MARK: - setup cell info about client
    func setupInfoAboutClient(inf: EgrResponse) {
        unpOut.text = optionalRemoveForIntStr(inf.data.first?.unp)
        imnsNumberOut.text = optionalRemoveForIntStr(inf.data.first?.imns)
        setupColorForStatus(statusOut, inf.data.first?.status)
        titleLabel.text = inf.data.first?.shortName ?? defaultDash
        nameOut.text = inf.data.first?.name ?? defaultDash
        registrImnsOut.text = inf.data.first?.imnsTitle ?? defaultDash
        regDateOut.text = converseDateToString(inf.data.first?.regDate)
        addressOut.text = optionalRemoveForIntStr(inf.data.first?.address).replacingOccurrences(of: "&quot;", with: "")
    }
}
   
  





