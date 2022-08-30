//
//  HistoryViewsVC.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 3.08.22.
//

import UIKit

class HistoryViewsVC: UIViewController {

    //MARK: VM var
    var historyVM: HistoryViewsProtocol = HistoryVM()
    
    //MARK: RootVM var for have unp data
    var rootViewModel: RootProtokol = RootVM()
    
    //MARK: isSearching?
    var isSearching: Bool = false
    
    //MARK: HeaderView
    @IBOutlet private weak var headerView: UIView! {
        didSet { setForSmallHeaderView(headerView) }
    }
    
    //MARK: SearchBar
    @IBOutlet private weak var searchBarOut: UISearchBar! {
        didSet { searchBarOut.delegate = self }
    }
    
    //MARK: TableView
     @IBOutlet private weak var tableView: UITableView! {
         didSet { tableView.delegate = self
                  tableView.dataSource = self }
     }
    
    //MARK: Label "History request"
    @IBOutlet private weak var titleHistoryLabel: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        historyVM.update = { self.tableView.reloadData() }
        historyVM.showClients()
        
    }
        
    //MARK: - Open clients
    func open(_ inf: History) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         guard let nextVC = storyboard.instantiateViewController(withIdentifier: "\(SearchResultVC.self)") as? SearchResultVC else { return }
        navigationController?.pushViewController(nextVC, animated: true)
        present(UINavigationController(rootViewController: nextVC), animated: true)
    }
}

//MARK: Extension for cells
extension HistoryViewsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(HistoryViewTableVCell.self)", for: indexPath) as? HistoryViewTableVCell
        isSearching ? cell?.setUpForListInDataBase(historyVM.filtredClient[indexPath.row]) : cell?.setUpForListInDataBase(historyVM.client[indexPath.row])
        //cell?.setUpForListInDataBase(historyVM.client[indexPath.row])
        return cell ?? .init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
        return historyVM.filtredClient.count
        } else {
        return historyVM.client.count
        }
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let unp = Int(historyVM.client[indexPath.row].unp ?? "0") {
            RootVM.unp = unp
        }
        open(historyVM.client[indexPath.row])
    }
    
    //MARK: - Methods for edit cells (for delete)
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removedClient = historyVM.client.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            HistoryCrDtService.mainContext.delete(removedClient)
            HistoryCrDtService.saveContext()
        }
    }
}

extension HistoryViewsVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        historyVM.filtredClient.removeAll()
        guard searchText != "" || searchText != " " else {
            print("empty search")
            return
        }
        historyVM.client.forEach { element in
            let text = searchText.lowercased()
            let isArrayContain = element.name?.lowercased().range(of: text)
            
            if isArrayContain != nil {
                print("Search complite")
                historyVM.filtredClient.append(element)
            }
        }
        print(historyVM.filtredClient)
        
        if searchBar.text == "" {
            isSearching = false
            tableView.reloadData()
        } else {
            isSearching = true
            historyVM.filtredClient = historyVM.client.filter({ $0.name?.lowercased().contains(searchBar.text?.lowercased()  ?? "") == .some(true) })
            tableView.reloadData()
        }
    }
}

