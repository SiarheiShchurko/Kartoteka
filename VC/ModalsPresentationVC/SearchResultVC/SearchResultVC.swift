//
//  SearchResultVC.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 27.06.22.
//

import UIKit

class SearchResultVC: UIViewController {
   
    let networkService = NetworkService()
    
    @IBOutlet private weak var informNotFound: UILabel! {
        didSet { informNotFound.isHidden = true }
    }
    @IBOutlet private weak var actInd: UIActivityIndicatorView! {
        didSet { actInd.isHidden = false
            actInd.startAnimating() }
    }
    
    @IBOutlet private weak var headerView: UIView! {
        didSet {
           setForSmallHeaderView(headerView)
        }
    }
    
    
    @IBOutlet private weak var tableViewOut: UITableView! {
        didSet {
            tableViewOut.dataSource = self
            tableViewOut.delegate = self
            tableViewOut.rowHeight = UITableView.automaticDimension
        }
    }
    
    var infoEgrArray: [EgrResponse] = []
    
    //MARK: Open full response for client
       private func open() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let nextVc = storyboard.instantiateViewController(withIdentifier: "\(FindingVC.self)") as? FindingVC else { return }
            navigationController?.pushViewController(nextVc, animated: true)
        }


    override func viewDidLoad() {
        super.viewDidLoad()
        
            networkService.loadInfo({  complition in
                switch complition {
                case .success(let inf):
                    self.infoEgrArray.append(inf)
                    DispatchQueue.main.async {
                        self.tableViewOut.reloadData()
                    }
                    self.actInd.stopAnimating()
                    self.actInd.isHidden = true
    
                case .failure(_):
                    self.checkError()
                    self.actInd.stopAnimating()
                    self.actInd.isHidden = true
                    
                case .outOfStock:
                    self.checkError()
                    self.actInd.stopAnimating()
                    self.actInd.isHidden = true
                }
                
            
                
            })
    }
    
    func checkError() {
        let alert = UIAlertController(title: "Ошибка", message: "1.Проверьте интернет соединение;\n2.Перейдите в настройки профиля для проверки вашего токена ;\n3. Проверьте введенный УНП клиента"
                                      , preferredStyle: .actionSheet)
                    let button = UIAlertAction(title: "Ок", style: .default, handler: {_ in
                        alert.dismiss(animated: true)} )
                  alert.addAction(button)
                   present(alert, animated: true)
    }
}



extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      infoEgrArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(SearchResultTableVCell.self)", for: indexPath) as? SearchResultTableVCell
        cell?.setupInfoAboutClient(inf: infoEgrArray[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        open()
    }
}




