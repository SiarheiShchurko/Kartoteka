//
//  HistoryViewsVC.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 3.08.22.
//

import UIKit

class HistoryViewsVC: UIViewController {
    var rootViewModel: RootProtokol = RootVM()
    var cell = HistoryViewTableVCell()
    
    @IBOutlet private weak var titleHistoryLabel: UILabel!
    @IBOutlet private weak var headerView: UIView! {
        didSet { setForSmallHeaderView(headerView) }
    }
    @IBOutlet private weak var tableView: UITableView! {
        didSet { tableView.delegate = self
                 tableView.dataSource = self
        }
    }
    
    private var client: [History] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showClients()
        
    }
    //MARK - Open clients
    func open(_ inf: History) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         guard let nextVC = storyboard.instantiateViewController(withIdentifier: "\(SearchResultVC.self)") as? SearchResultVC else { return }
        present(UINavigationController(rootViewController: nextVC), animated: true)
    }
    
    
    //MARK: func Sort list clients in DataBase
    
    private func showClients() {
        let request = History.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(History.date), ascending: false)]
        let client = try? HistoryCrDtService.mainContext.fetch(request)
        self.client = client ?? []
        tableView.reloadData()
    }
}

extension HistoryViewsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        client.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(HistoryViewTableVCell.self)", for: indexPath) as? HistoryViewTableVCell
        cell?.setUpForListInDataBase(client[indexPath.row])
        return cell ?? .init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let unp = Int(client[indexPath.row].unp ?? "0") {
            RootVM.unp = unp
        }
        open(client[indexPath.row])
    }
    
 
    
    //MARK: - Methods for edit cells
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removedClient = client.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            HistoryCrDtService.mainContext.delete(removedClient)
            HistoryCrDtService.saveContext()
        }
    }
}


