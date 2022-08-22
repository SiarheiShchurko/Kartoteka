//
//  Modals.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 6.07.22.
//

import UIKit

struct EgrResponse: Codable {
    
    var data: [EgrInfo]

}

//MARK - JsonParsing for EGR api
struct EgrInfo: Codable {
    var unp: Int?  ///УНП
    var name: String?  ///Полное наименование
    var shortName: String?
    var address: String?   /// Юридический адрес
    var imns: Int?  /// Код ИМНС
    var imnsTitle: String? /// Наименование ИМНС
    var regDate: Date? /// Дата регистрации МНС
    var status: String?  ///Статус

    enum CodingKeysEGR: String, CodingKey  {
        case unp
        case name
        case shortName = "short_name"
        case address 
        case imns
        case imnsTitle = "imns_title"
        case regDate = "reg_date"
        case status

}
   init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeysEGR.self)
       unp = try? container.decodeIfPresent(Int.self, forKey: .unp)
       name = try? container.decodeIfPresent(String.self, forKey: .name)
       shortName = try? container.decodeIfPresent(String.self, forKey: .shortName)
       address = try? container.decodeIfPresent(String.self, forKey: .address)
       imns = try? container.decodeIfPresent(Int.self, forKey: .imns)
       imnsTitle = try? container.decodeIfPresent(String.self, forKey: .imnsTitle)
       regDate = try? container.decodeIfPresent(Date.self, forKey: .regDate)
       status = try? container.decodeIfPresent(String.self, forKey: .status)
}
}
