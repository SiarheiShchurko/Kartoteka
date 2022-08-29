//
//  SearchResultVC.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 27.06.22.
//

import UIKit

class SearchResultVC: UIViewController {
   //MARK: VM var
    var searchVM: SearchProtocol = SearchResultVM()
    
    //MARK: HeaderView
    @IBOutlet private weak var headerView: UIView! {
        didSet {
           setForSmallHeaderView(headerView)
        }
    }
    
    //MARK: TableView
    @IBOutlet private weak var tableViewOut: UITableView! {
        didSet {
            tableViewOut.dataSource = self
            tableViewOut.delegate = self
            tableViewOut.rowHeight = UITableView.automaticDimension
        }
    }
    
    //MARK: Outlet UIActivityIndicatorView
    @IBOutlet private weak var actInd: UIActivityIndicatorView! {
        didSet { actInd.isHidden = false
            actInd.startAnimating() }
    }
    
    //MARK: Open full response for client
       private func open() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let nextVc = storyboard.instantiateViewController(withIdentifier: "\(FindingVC.self)") as? FindingVC else { return }
            navigationController?.pushViewController(nextVc, animated: true)
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Func update for VM
        searchVM.update = {
            //Update tableView
            self.tableViewOut.reloadData()
            //If data is empty, show alert "Check error"
            if self.searchVM.infoEgrArray.first?.data.first?.name == nil,
               self.searchVM.infoEgrArray.first?.data.first?.unp == nil {
               self.checkError() }
            //If info success find, stop animating
            self.actInd.stopAnimating()
            self.actInd.isHidden = true }
            
            //Func if server no have answer more 10 seconds
            searchVM.noConnect = {
            self.tableViewOut.reloadData()
            self.actInd.stopAnimating()
            self.actInd.isHidden = true
            self.checkConnect()
        }
       
        //If time request more 10 seconds - call checkConnect
        searchVM.timerFunc()
        //if information was loaded append this in array
        searchVM.loadInfo()
    }
    
    
    //MARK: Check internet. Call when answer from server absent
    func checkConnect() {
        let alert = UIAlertController(title: "Информация не найдена", message: "1.Проверьте интернет соединение"
                                      , preferredStyle: .actionSheet)
                    let button = UIAlertAction(title: "Ок", style: .default, handler: {_ in
                        alert.dismiss(animated: true)} )
                  alert.addAction(button)
                   present(alert, animated: true)
    }
    
    //MARK: Func call when user enter miss unp or token
    func checkError() {
        let alert = UIAlertController(title: "Информация не найдена", message: "1.Проверьте введенный УНП клиента;\n2.Перейдите в настройки профиля и проверьте Ваш актуальный токен;\n3.Дополнительно проверьте интернет соединение"
                                      , preferredStyle: .actionSheet)
                    let button = UIAlertAction(title: "Ок", style: .default, handler: {_ in
                        alert.dismiss(animated: true)} )
                  alert.addAction(button)
                   present(alert, animated: true)
    }
}

//MARK: Extension for cells
extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchVM.infoEgrArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SearchResultTableVCell.self)", for: indexPath) as? SearchResultTableVCell
        cell?.setupInfoAboutClient(inf: searchVM.infoEgrArray[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    //MARK: didSelectRow
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        open()
    }
}




