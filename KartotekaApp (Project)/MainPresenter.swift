//
//  MainPresenter.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 3.08.22.
//

//import Foundation
//import UIKit
//protocol MainViewProtocol: AnyObject {
//    func success()
//    func failure(error: Error)
//}
//protocol MainViewPresenterProtocol: AnyObject {
//    init(_ view: MainViewProtocol, _ networkService: NetworkServiceProtocol)
//    func getClientInf()
//    var dataBase: EgrResponse? { get set }
//}
//class MainPresenter: MainViewPresenterProtocol {
//    weak var view: MainViewProtocol?
//     let networkService: NetworkServiceProtocol!
//     var dataBase: EgrResponse?
//    
//    required init(_ view: MainViewProtocol, _ networkService: NetworkServiceProtocol) {
//        self.view = view
//        self.networkService = networkService
//        getClientInf()
//    }
//
//    func getClientInf() {
//        networkService.getClientsDate { [weak self] result in
//            guard self != nil else { return }
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let dataBase):
//                    self?.dataBase = dataBase
//                    self?.view?.success()
//                    
//                case .failure(let error):
//                    self?.view?.failure(error: error)
//                }
//            }
//        }
//        }
//    }
//
