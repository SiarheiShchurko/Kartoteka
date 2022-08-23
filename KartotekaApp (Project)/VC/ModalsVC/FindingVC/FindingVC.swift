//
//  FindingVC.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 20.07.22.
//

import UIKit

class FindingVC: UIViewController {
    
    var findingVM: FindingVMProtocol = FindingVM()
    
    @IBOutlet private weak var actInd: UIActivityIndicatorView! {
        didSet { actInd.isHidden = false
            actInd.startAnimating() }
    }
    @IBOutlet private weak var tableViewOut: UITableView! {
        didSet {
            tableViewOut.delegate = self
            tableViewOut.dataSource = self
            tableViewOut.rowHeight = UITableView.automaticDimension
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //Change naming barButtonItem
        navigationController?.navigationBar.items?.forEach({ item in
            item.backButtonTitle = "Назад" })
        //Func update - call if info loadet to array
        findingVM.update = { self.tableViewOut.reloadData()
            self.actInd.stopAnimating()
            self.actInd.isHidden = true }
        
        //If info no load 10 sec - call func checkConnect
        findingVM.noConnect = {
            self.tableViewOut.reloadData()
                self.actInd.stopAnimating()
                self.actInd.isHidden = true
            self.checkConnect()
            
        }
        //Start timer for load 10 sec
        findingVM.timerFunc()
        //Load information to array
        findingVM.loadInfo()
        
    }
    
    func checkConnect() {
        let alert = UIAlertController(title: "Информация не найдена", message: "1.Проверьте интернет соединение и повторите попытку"
                                      , preferredStyle: .actionSheet)
                    let button = UIAlertAction(title: "Ок", style: .default, handler: {_ in
                        alert.dismiss(animated: true)} )
                  alert.addAction(button)
                   present(alert, animated: true)
    }
}

extension FindingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        findingVM.arrayInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(FindingListVCell.self)", for: indexPath) as? FindingListVCell
        cell?.setUpContragentName(findingVM.arrayInfo[indexPath.row])
        return cell ?? .init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
