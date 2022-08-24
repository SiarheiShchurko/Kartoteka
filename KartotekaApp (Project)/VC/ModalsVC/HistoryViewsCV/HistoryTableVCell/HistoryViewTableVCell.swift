//
//  HistoryViewTableVCell.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 3.08.22.
//

import UIKit

class HistoryViewTableVCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet private weak var clientLabelOut: UILabel!
    @IBOutlet private weak var clientNameOut: UILabel!
    @IBOutlet private weak var unpLabelOut: UILabel!
    @IBOutlet private weak var unpNumberOut: UILabel!
    @IBOutlet private weak var dateLabelOut: UILabel!
    @IBOutlet private weak var dateNumberOut: UILabel!
    
    //MARK: Setup cell
    func setUpForListInDataBase(_ client: History) {
        clientNameOut.text = client.name
        unpNumberOut.text = client.unp
        dateNumberOut.text = converseDateToString(client.date) 
        setupForLabelScreenSize(clientNameOut)
        setupForLabelScreenSize(unpNumberOut)
        setupForLabelScreenSize(dateNumberOut)
    }
}
