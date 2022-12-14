//
//  File.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 18.07.22.
//

import Foundation
import UIKit

enum ObtainClientsInform {
    case success(inf: EgrResponse)
    case failure(error: Error)
    case outOfStock
}

class NetworkService {
   
    var searchVC: SearchResultVC?
    var token: String {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: Profile.ProfileKeys.token) ?? "Токен не введен"
    }
    let session = URLSession.shared
    let decoder = JSONDecoder()
    let dateFormatter = DateFormatter()
    
    func loadInfo(_ complition: @escaping (ObtainClientsInform) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            if let unp = RootVM.unp {
                    print("Look at me now \(unp)")
                    var result: ObtainClientsInform = .outOfStock
                    guard let url = URL(string: "https://api.kartoteka.by/egr/\(unp)?access-token=\(self.token)") else { return }
                    var request = URLRequest(url: url)
                    request.httpMethod = "GET"
                    self.session.dataTask(with: request) { [ weak self ] (responseData, response, error) in
                        
                        guard let strongSelf = self else { return }
                        print(response ?? "Response clear")
                        if let error = error {
                            print(error.localizedDescription)
                        } else if let data = responseData, error == nil {
                            self?.dateFormatter.dateFormat = "yyyy-MM-dd"
                            self?.decoder.dateDecodingStrategy = .formatted(self?.dateFormatter ?? DateFormatter())
                            do {
                                guard let infoEGR = try? strongSelf.decoder.decode(EgrResponse.self, from: data) else { return }
                                    result = .success(inf: infoEGR)
                                DispatchQueue.main.async {
                                    complition(result) }
                                HistoryCrDtService.saveDataBaseMethod(infoEGR)
                       }
        }
                    }.resume()
                }
        }
    
    }
}
    

    
   
    



