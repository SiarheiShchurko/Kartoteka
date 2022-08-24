//
//  CountryListVC.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 24.06.22.
//

import UIKit

//MARK: Protocol for Delegate
protocol GetInfoDelegate: AnyObject {
    
    func getInfo(_ info: Settings)
}

class CountryListVC: UIViewController {
    //MARK: VM var
    var countryListVM: CountryListProtocol = CountryListVM()
    
    //MARK: Delegate var
    weak var delegate: GetInfoDelegate?
    
    //MARK: HeaderView
    @IBOutlet private weak var headerView: UIView! {
        didSet {
           setForSmallHeaderView(headerView) }
    }
    
    //MARK: TableView
    @IBOutlet private weak var tableViewOut: UITableView! {
        didSet {  tableViewOut.delegate = self
                  tableViewOut.dataSource = self }
    }
    
}

//MARK: Extension for set count cells, design cells and tap. 
extension CountryListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryListVM.countrysArray.count
    }
    
    //MARK: Header for section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      "Доступные страны:"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CountrysVCell.self)", for: indexPath) as? CountrysVCell
        cell?.setupCell(Settings.init(countryChanged: countryListVM.countrysArray[indexPath.row]))
        return cell ?? .init()
    }
    
    //MARK: DidSelectRow
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let userDefaults = UserDefaults.standard
        userDefaults.set(countryListVM.countrysArray[indexPath.row], forKey: CountryListVM.KeysForDefaults.selectedCountry)
        delegate?.getInfo(Settings.init(countryChanged: countryListVM.countrysArray[indexPath.row]))
        dismiss(animated: true)
        }
    }
                    
    
    
    

