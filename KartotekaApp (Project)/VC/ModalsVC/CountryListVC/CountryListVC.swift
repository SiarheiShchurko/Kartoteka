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
    var countryListVM: CountryListProtocol = CountryListVM()
    
    weak var delegate: GetInfoDelegate?
    
    @IBOutlet private weak var headerView: UIView! {
        didSet {
           setForSmallHeaderView(headerView)
        }
    }

    @IBOutlet private weak var tableViewOut: UITableView! {
        didSet {  tableViewOut.delegate = self
                  tableViewOut.dataSource = self }
    }
}

extension CountryListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryListVM.countrysArray.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      "Доступные страны:"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CountrysVCell.self)", for: indexPath) as? CountrysVCell
        cell?.setupCell(Settings.init(countryChanged: countryListVM.countrysArray[indexPath.row]))
        return cell ?? .init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let userDefaults = UserDefaults.standard
        userDefaults.set(countryListVM.countrysArray[indexPath.row], forKey: CountryListVM.KeysForDefaults.selectedCountry)
        delegate?.getInfo(Settings.init(countryChanged: countryListVM.countrysArray[indexPath.row]))
        dismiss(animated: true)
        }
    }
                    
    
    
    

