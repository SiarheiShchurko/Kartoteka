//
//  NewsVC.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 27.06.22.
//

import UIKit

class NewsVC: UIViewController {
    
    let newsModel: NewsProtocol = NewsVM()
    
    @IBOutlet private weak var tableViewOut: UITableView! {
        didSet { tableViewOut.dataSource = self
                 tableViewOut.delegate = self }
    }
    
    @IBOutlet private weak var headerView: UIView! {
        didSet { setColorSize(headerView) }
    }
    @IBOutlet private weak var newsLabelOut: UILabel! {
        didSet { newsLabelOut.text = "Новости"
                 setupForHeaderViewLabel(newsLabelOut) }
    }
    
    @IBOutlet private weak var secondNewsLabelOut: UILabel! {
        didSet { secondNewsLabelOut.text = "Последние новости и обновления от Картотеки"
                 setupForLabelScreenSize(secondNewsLabelOut) }
    }
}
//MARK - Method for open news link


extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsModel.newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewsVCell.self)", for: indexPath) as? NewsVCell
        cell?.setForNewsCells(newsModel.newsArray[indexPath.row])
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        newsModel.openNews(newsModel.newsArray[indexPath.row])
    }
}
