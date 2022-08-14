//
//  File.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 20.07.22.
//

import Foundation
import UIKit

final class NetworkServiceFind {
    
    
    var networkService = NetworkService()
    
    var token: String {
        networkService.token
    }
  
    let session = URLSession.shared
    let decoder = JSONDecoder()
    let dateFormatter = DateFormatter()
    
    func loadInfo(_ complition: @escaping (FullResponse) -> Void) {
        if let unp = RootVM.unp {
            guard let url = URL(string: "https://api.kartoteka.by/summary/\(unp)?access-token=\(token)") else { return }
           
            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            session.dataTask(with: request) { [ weak self ] (responseData, response, error) in
                guard let strongSelf = self else { return }
                
                print(response ?? "Response clear")
                if let error = error {
                    print(error.localizedDescription)
                } else if let data = responseData, error == nil {
                    self?.dateFormatter.dateFormat = "yyyy-MM-dd"
                    self?.decoder.dateDecodingStrategy = .formatted(self?.dateFormatter ?? DateFormatter())
                    
                    guard let infoEGR = try? strongSelf.decoder.decode(FullResponse.self, from: data) else { return }
                   
                        DispatchQueue.main.async {
                            complition(infoEGR)
                        }
                }
            }.resume()
        }
    }
}

    

