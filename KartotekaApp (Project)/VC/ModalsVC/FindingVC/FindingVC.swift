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
//    var arrayInfo: [FullResponse] = [] {
//        didSet {
//            tableViewOut.reloadData()
//            actInd.stopAnimating()
//            actInd.isHidden = true
//        }
//    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationController?.navigationBar.items?.forEach({ item in
            item.backButtonTitle = "Назад" })
        findingVM.update = {
            self.tableViewOut.reloadData()
            self.actInd.stopAnimating()
            self.actInd.isHidden = true
        }
        findingVM.loadInfo()
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
