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
            headerView.backgroundColor = UIColor(red: 1, green: 0.87, blue: 0.2, alpha: 1)
            headerView.frame.size.width = UIScreen.main.bounds.width
            headerView.frame.size.height = UIScreen.main.bounds.height / 10.0
        }
    }

    @IBOutlet private weak var tableViewOut: UITableView! {
        didSet {
            tableViewOut.delegate = self
            tableViewOut.dataSource = self
        }
    }
    
    var countrysArray: [[String]] = [["Беларусь"], ["Россия", "Украина", "Казахстан"]]
    
}

extension CountryListVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var headerName = ""
        if section < 1 {
          headerName = "Доступные страны:"
        } else {
            headerName = "Недоступные страны:"
        }
       return headerName
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        countrysArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section1 = countrysArray[section]
        return section1.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //fixme
        let section = countrysArray[indexPath.section]
        let cellType = section[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CountrysVCell.self)", for: indexPath) as? CountrysVCell
        cell?.setupCell(Settings.init(countryChanged: cellType))
        return cell ?? .init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = countrysArray[indexPath.section]
        let userDefaults = UserDefaults.standard
        userDefaults.set(section[indexPath.row], forKey:KeysForDefaults.selectedCountry)
        delegate?.getInfo(Settings.init(countryChanged: section[indexPath.row]))
        dismiss(animated: true)
        }
    }
                    
    
    
    

