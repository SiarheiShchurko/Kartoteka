//
//  CountryListVC.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 24.06.22.
//

import UIKit

protocol GetInfoDelegate: AnyObject {
    
    func getInfo(_ info: Settings)
}

class CountryListVC: UIViewController {
    
    enum KeysForDefaults {
        
        static var selectedCountry = ""
        
    }
    
    weak var delegate: GetInfoDelegate?
    
    @IBOutlet private weak var headerView: UIView! {
        didSet {
           setForSmallHeaderView(headerView)
        }
    }

    @IBOutlet private weak var tableViewOut: UITableView! {
        didSet {
            tableViewOut.delegate = self
            tableViewOut.dataSource = self
        }
    }
    
    var countrysArray: [String] = ["Беларусь", "Россия", "Украина", "Казахстан"]
    
}

extension CountryListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countrysArray.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      "Доступные страны:"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CountrysVCell.self)", for: indexPath) as? CountrysVCell
        cell?.setupCell(Settings.init(countryChanged: countrysArray[indexPath.row]))
        return cell ?? .init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let userDefaults = UserDefaults.standard
        userDefaults.set(countrysArray[indexPath.row], forKey:KeysForDefaults.selectedCountry)
        delegate?.getInfo(Settings.init(countryChanged: countrysArray[indexPath.row]))
        dismiss(animated: true)
        }
    }
                    
    
    
    

