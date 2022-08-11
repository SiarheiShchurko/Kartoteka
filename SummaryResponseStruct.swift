//
//  bigDataStruct.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 8.07.22.
//

import UIKit

struct FullResponse: Codable {
    var data: BigData
}

struct BigData: Codable {
    
    var unp: Int?
    var name: String?
    var address: String?
    var mnsRegDate: Date?
    var statusMns: String?
    var eliminationDate: Date?
    var imnsCode: Int?
    var imnsName: String?
    var charterCapital: Int?
    var charterCapitalCurrency: Int?
    var ambargo: Bool?
    var egrRegOgrCode: Int?
    var egrRegOgrName: String?
    var egrRegDate: Date?
    var egrEliminationDate: Date?
    var egrStatusCode: Int?
    var egrStatusName: String?
    var egrName: String?
    var egrNameBel: String?
    var egrSubjectHistory: [EGRSubjectHistory?]
    var writ: WritInfo?
    var courtSessions: СourtSessionsInfo?
    var executory: ExecutoryInfo?
    var imnsDebtors: [IMNSDebtors?]
    var imnsDebtorsInMonth: [IMNSDebtorsInMonth?]
    var socialSecurityFound: [SocialSecurityFound?]
    var bankruptcy: BankruptcyInfo?
    var risk: RiskInfo?
    var liquidation: LiquidationInfo?
    var checks: [Checks?]
    var disqualifiedProviders: DisqualifiedProvidersInfo?
    var certs: [Certs?]
    var charterCapitalChanges: CharterCapitalChangesInfo?
    var trades: TradesInfo?
    var banksGuarantees: BanksGuaranteesInfo?
    var belcci: BelcciInfo?
    var fez: FezInfo?
    var auctions: [Auctions?]
    var trademarks: TrademarksInfo?
    var certsOfConf: CertsOfConfInfo?
  
    enum KeysBigData: String, CodingKey {
        case unp, name, address, ambargo, writ, executory, bankruptcy, risk, liquidation, checks, certs, trades, belcci, fez, auctions, trademarks
        case mnsRegDate = "mns_reg_date"
        case statusMns = "status_mns"
        case eliminationDate = "elimination_date"
        case imnsCode = "imns_code"
        case imnsName = "imns_name"
        case charterCapital = "charter_capital"
        case charterCapitalCurrency = "charter_capital_currency"
        case egrRegOgrCode = "egr_reg_ogr_code"
        case egrRegOgrName = "egr_reg_ogr_name"
        case egrRegDate = "egr_reg_date"
        case egrEliminationDate = "egr_elimination_date"
        case egrStatusCode = "egr_status_code"
        case egrStatusName = "egr_status_name"
        case egrName = "egr_name"
        case egrNameBel = "egr_name_bel"
        case egrSubjectHistory = "egr_subject_history"
        case courtSessions = "court_sessions"
        case imnsDebtors = "imns_debtors"
        case imnsDebtorsInMonth = "imns_debtors_in_month"
        case socialSecurityFound = "social_security_found"
        case disqualifiedProviders = "disqualified_providers"
        case charterCapitalChanges = "charter_capital_changes"
        case banksGuarantees = "banks_guarantees"
        case certsOfConf = "certs_of_conf"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: KeysBigData.self)
        
        self.unp = try? container.decode(Int.self, forKey: .unp)
        self.name = try? container.decode(String.self, forKey: .name)
        self.address = try? container.decode(String.self, forKey: .address)
        self.mnsRegDate = try? container.decode(Date.self, forKey: .mnsRegDate)
        self.statusMns = try? container.decode(String.self, forKey: .statusMns)
        self.eliminationDate = try? container.decode(Date.self, forKey: .eliminationDate)
        self.imnsCode = try? container.decode(Int.self, forKey: .imnsCode)
        self.imnsName = try? container.decode(String.self, forKey: .imnsName)
        self.charterCapital = try? container.decode(Int.self, forKey: .charterCapital)
        self.charterCapitalCurrency = try? container.decode(Int.self, forKey: .charterCapitalCurrency)
        self.ambargo = try? container.decode(Bool.self, forKey: .ambargo)
        self.egrRegOgrCode = try? container.decode(Int.self, forKey: .egrRegOgrCode)
        self.egrRegOgrName = try? container.decode(String.self, forKey: .egrRegOgrName)
        self.egrRegDate = try? container.decode(Date.self, forKey: .egrRegDate)
        self.egrEliminationDate = try? container.decode(Date.self, forKey: .egrEliminationDate)
        self.egrStatusCode = try? container.decode(Int.self, forKey: .egrStatusCode)
        self.egrStatusName = try? container.decode(String.self, forKey: .egrStatusName)
        self.egrName = try? container.decode(String.self, forKey: .egrName)
        self.egrNameBel = try? container.decode(String.self, forKey: .egrNameBel)
        self.egrSubjectHistory = try container.decode([EGRSubjectHistory?].self, forKey: .egrSubjectHistory)
        self.writ = try? container.decode(WritInfo.self, forKey: .writ)
        self.courtSessions = try? container.decode(СourtSessionsInfo.self, forKey: .courtSessions)
        self.executory = try? container.decode(ExecutoryInfo.self, forKey: .executory)
        self.imnsDebtors = try container.decode([IMNSDebtors].self, forKey: .imnsDebtors)
        self.imnsDebtorsInMonth = try container.decode([IMNSDebtorsInMonth?].self, forKey: .imnsDebtorsInMonth)
        self.socialSecurityFound = try container.decode([SocialSecurityFound?].self, forKey: .socialSecurityFound )
        self.bankruptcy = try? container.decode(BankruptcyInfo.self, forKey: .bankruptcy)
        self.risk = try? container.decode(RiskInfo.self, forKey: .risk)
        self.liquidation = try? container.decode(LiquidationInfo.self, forKey: .liquidation)
        self.checks = try container.decode([Checks?].self, forKey: .checks)
        self.disqualifiedProviders = try? container.decode(DisqualifiedProvidersInfo?.self, forKey: .disqualifiedProviders)
        certs = try container.decode([Certs?].self, forKey: .certs)
        self.charterCapitalChanges = try? container.decode(CharterCapitalChangesInfo.self, forKey: .charterCapitalChanges)
        trades = try? container.decode(TradesInfo.self, forKey: .trades)
        banksGuarantees = try? container.decode(BanksGuaranteesInfo.self, forKey: .banksGuarantees)
        belcci = try? container.decode(BelcciInfo.self, forKey: .belcci)
        fez = try? container.decode(FezInfo.self, forKey: .fez)
        auctions = try container.decode([Auctions?].self, forKey: .auctions)
        trademarks = try? container.decode(TrademarksInfo.self, forKey: .trademarks)
        self.certsOfConf = try? container.decode(CertsOfConfInfo.self, forKey: .certsOfConf)
        
    }
}
    struct EGRSubjectHistory: Codable {
        var date: Date?
        var info: String?
    }
    
    struct WritInfo: Codable {
        var creditor: Int?
        var debtor: Int?
    }
    
    struct СourtSessionsInfo: Codable {
        var creditor: Int?
        var debtor: Int?
    }
    
    struct ExecutoryInfo: Codable {
        var debtor: Int?
    }
    
    struct IMNSDebtors: Codable {
        var city: String?
        var date: Date?
    }
    
    struct IMNSDebtorsInMonth: Codable {
        var mnsCode: Int?
        var date: Date?
        
        enum KeysIMNSDebtorsInMonth: String, CodingKey {
            case date
            case mnsCode = "mns_code"
        }
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: KeysIMNSDebtorsInMonth.self)
            self.mnsCode = try? container.decode(Int.self, forKey: .mnsCode)
            self.date = try? container.decode(Date.self, forKey: .date)
        }
    }
    
    struct SocialSecurityFound: Codable {
        var sum: Float?
        var date: Date?
    }
    
    struct BankruptcyInfo: Codable {
        var dealNumber: String?
        var processCode: Int?
        var processName: String?
        var startDate: Date?
        var closeDate: Date?
        var status: Bool?
        
        enum KeysBankruptcyInfo: String, CodingKey {
            case dealNumber = "deal_number"
            case processCode = "process_code"
            case processName = "process_name"
            case startDate = "start_date"
            case closeDate = "close_date"
            case status
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: KeysBankruptcyInfo.self)
            self.dealNumber = try? container.decode(String.self, forKey: .dealNumber)
            self.processCode = try? container.decode(Int.self, forKey: .processCode)
            self.processName = try? container.decode(String.self, forKey: .processName)
            self.startDate = try? container.decode(Date.self, forKey: .startDate)
            self.closeDate = try? container.decode(Date.self, forKey: .closeDate)
            self.status = try? container.decode(Bool.self, forKey: .status)
        }
    }
    
    struct RiskInfo: Codable {
        var reason: String?
        var date: Date?
    }
    
    struct LiquidationInfo: Codable {
        var decisionDate: Date?
        var liqFio: String?
        var liqAddress: String?
        var liqPhone: String?
        var decisionTerm: Int?
        var publishDate: Date?
        var currentStatus: String?
        
        enum KeysLiquidationInfo: String, CodingKey {
            case decisionDate = "decision_date"
            case liqFio = "liq_fio"
            case liqAddress = "liq_address"
            case liqPhone = "liq_phone"
            case decisionTerm = "decision_term"
            case publishDate = "publish_date"
            case currentStatus = "current_status"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: KeysLiquidationInfo.self)
            self.decisionDate = try? container.decode(Date.self, forKey: .decisionDate)
            self.liqFio = try? container.decode(String.self, forKey: .liqFio)
            self.liqAddress = try? container.decode(String.self, forKey: .liqAddress)
            self.liqPhone = try? container.decode(String.self, forKey: .liqPhone)
            self.decisionTerm = try? container.decode(Int.self, forKey: .decisionTerm)
            self.publishDate = try? container.decode(Date.self, forKey: .publishDate)
            self.currentStatus = try? container.decode(String.self, forKey: .currentStatus)
        }
        
    }
    
    struct Checks: Codable {
        var checksInMonth: Int?
        var month: Int?
        var year: Int?
        
        enum KeysChecks: String, CodingKey {
            case year, month
            case checksInMonth = "checks_in_month"
        }
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: KeysChecks.self)
            self.year = try? container.decode(Int.self, forKey: .year)
            self.month = try? container.decode(Int.self, forKey: .month)
            self.checksInMonth = try? container.decode(Int.self, forKey: .checksInMonth)
        }
    }
    
    struct DisqualifiedProvidersInfo: Codable {
        var description: String?
        var excDescription: String?
        
        enum KeysDisqualifiedProvidersInfo: String, CodingKey {
            case description
            case excDescription = "exc_description"
        }
        init(from decoder: Decoder) throws {
            let conteiner = try decoder.container(keyedBy: KeysDisqualifiedProvidersInfo.self)
            self.description = try? conteiner.decode(String.self, forKey: .description)
            self.excDescription = try? conteiner.decode(String.self, forKey: .excDescription)
        }
        
    }
    
    struct Certs: Codable {
        var code: Int?
        var type: String?
        var quantity: Int?
    }
    
    struct CharterCapitalChangesInfo: Codable {
        var newCharterCapital: Int?
        var decreeDate: Date?
        var publishDate: Date?
        
        enum KeysCharterCapitalChangesInfo: String, CodingKey {
            case newCharterCapital = "new_charter_capital"
            case decreeDate = "decree_date"
            case publishDate = "publish_date"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: KeysCharterCapitalChangesInfo.self)
            self.newCharterCapital = try? container.decode(Int.self, forKey: .newCharterCapital)
            self.decreeDate = try? container.decode(Date.self, forKey: .decreeDate)
            self.publishDate = try? container.decode(Date.self, forKey: .publishDate)
        }
    }
    
    struct TradesInfo: Codable {
        var customer: TradeStats?
        var provider: TradeStats?
        
        enum KeyForTrades: String, CodingKey {
            case customer
            case provider
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: KeyForTrades.self)
            self.customer = try? container.decode(TradeStats?.self, forKey: .customer )
            self.provider = try? container.decode(TradeStats?.self, forKey: .provider )
        }
        
    }
        
struct TradeStats: Codable {
    var quantity: Int?
    var sumByn: Float?
    
    enum KeysTradeStats: String, CodingKey {
        case quantity
        case sumByn = "sum_byn"
    }
    
    init(from decoder: Decoder) throws {
        let conteiner = try decoder.container(keyedBy: KeysTradeStats.self)
        self.quantity = try? conteiner.decodeIfPresent(Int.self, forKey: .quantity)
        self.sumByn = try? conteiner.decodeIfPresent(Float.self, forKey: .sumByn)
    }
}
    
    struct BanksGuaranteesInfo: Codable {
        var principal: Int?
        var beneficiary: Int?
    }
    
    struct BelcciInfo: Codable {
        var manager: String?
        var email: String?
        var site: String?
        var phone: String?
    }
    
    struct FezInfo: Codable {
        var name: String?
        var project: String?
    }
    
    struct Auctions: Codable {
        var status: String?
        var quantity: Int?
    }
    
    struct TrademarksInfo: Codable {
        var quantity: Int?
    }
    
    struct CertsOfConfInfo: Codable {
        var quantity: Int?
    }
    
    
  
