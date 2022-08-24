//
//  FindingListVCell.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 20.07.22.
//

import UIKit

class FindingListVCell: UITableViewCell {
    
    //MARK: Outlets
    
    //MNS
    @IBOutlet private weak var unpOut: UILabel!
    @IBOutlet private weak var contragentNameOut: UILabel!
    @IBOutlet private weak var adressMnsOut: UILabel!
    @IBOutlet private weak var dateRegistrtionOut: UILabel!
    @IBOutlet private weak var dateLiqudationOut: UILabel!
    @IBOutlet private weak var clientAdress: UILabel!
    @IBOutlet private weak var clientStatusOut: UILabel!
    //EGR
    @IBOutlet private weak var egrCodeOut: UILabel!
    @IBOutlet private weak var nameEgrOrganOut: UILabel!
    @IBOutlet private weak var dateRegistrationEgrOut: UILabel!
    @IBOutlet private weak var dateExitFromEgrOut: UILabel!
    @IBOutlet private weak var statusCodeEgrOut: UILabel!
    @IBOutlet private weak var egrStatusOut: UILabel!
    @IBOutlet private weak var blrNameClient: UILabel!
    @IBOutlet private weak var shortBlrNameOut: UILabel!
    @IBOutlet private weak var historyChangingInEgrOut: UILabel!
    //Finance
    @IBOutlet private weak var fondSummOut: UILabel!
    @IBOutlet private weak var valuteCodeOut: UILabel!
    @IBOutlet private weak var vetoOnSaleOut: UILabel!
    //WritInfo
    @IBOutlet private weak var creditorWritOut: UILabel!
    @IBOutlet private weak var debitorWritOut: UILabel!
    //CourtSession
    @IBOutlet private weak var creditorCourtOut: UILabel!
    @IBOutlet private weak var debitorCourtOut: UILabel!
    //Exucutory
    @IBOutlet private weak var debitorExecutoryOut: UILabel!
    //MNSDebtors
    @IBOutlet private weak var imnsDebtorsFirstDayOut: UILabel!
    //IMNSDebtorsMonthContinied
    @IBOutlet private weak var imnsDebtorsInMonthOut: UILabel!
    //socialSecurityFound
    @IBOutlet private weak var socialSecurityFoundOut: UILabel!
    //bankruptstvo
    @IBOutlet private weak var dealNumberOut: UILabel!
    @IBOutlet private weak var processCodeOut: UILabel!
    @IBOutlet private weak var processNameOut: UILabel!
    @IBOutlet private weak var startDateOut: UILabel!
    @IBOutlet private weak var closeDateOut: UILabel!
    @IBOutlet private weak var statusOut: UILabel!
    //RiskInfo
    @IBOutlet private weak var riskReasonOut: UILabel!
    @IBOutlet private weak var dateRiskOut: UILabel!
    //Liqudation
    @IBOutlet private weak var decisionDateOut: UILabel!
    @IBOutlet private weak var liqFioOut: UILabel!
    @IBOutlet private weak var liqAddressOut: UILabel!
    @IBOutlet private weak var liqPhoneOut: UILabel!
    @IBOutlet private weak var decisionTermOut: UILabel!
    @IBOutlet private weak var publishDateOut: UILabel!
    @IBOutlet private weak var currentStatusOut: UILabel!
    //Checks
    @IBOutlet private weak var checkInMonthOut: UILabel!
    //DisqualifiedProvidersInfo
    @IBOutlet private weak var descriptionOut: UILabel!
    @IBOutlet private weak var excDescription: UILabel!
    //Certs[]
    @IBOutlet private weak var certsOut: UILabel!
    //CharterCapitalChangesInfo
    @IBOutlet private weak var newCharterCapitalOut: UILabel!
    @IBOutlet private weak var decreeDateOut: UILabel!
    @IBOutlet private weak var publishDateCapitalChangesOut: UILabel!
    //TradesInfo
    @IBOutlet private weak var customerOut: UILabel!
    @IBOutlet private weak var providerOut: UILabel!
    //BanksGuaranteesInfo
    @IBOutlet private weak var beneficiaryOut: UILabel!
    @IBOutlet private weak var principalOut: UILabel!
    
    //BelcciInfo
    @IBOutlet private weak var managerBelccOut: UILabel!
    @IBOutlet private weak var emailBelccOut: UILabel!
    @IBOutlet private weak var siteBelccOut: UILabel!
    @IBOutlet private weak var phoneBelccOut: UILabel!
   
    //FezInfo
    @IBOutlet private weak var nameFezInfoOut: UILabel!
    @IBOutlet private weak var projectFezInfoOut: UILabel!
    //Auctions[]
    @IBOutlet private weak var auctionsOut: UILabel!
    //TrademarksInfo
    @IBOutlet private weak var quantityTrademarksOut: UILabel!
    //CertsOfConfInfo
    @IBOutlet private weak var quantityCertsOfConf: UILabel!
    
    
    //MARK: set label func
    func setUpContragentName(_ inf: FullResponse) {
        //MARK - set MNS
        unpOut.text = optionalRemoveForIntStr(inf.data.unp)
        contragentNameOut.text = inf.data.name ?? defaultDash
        adressMnsOut.text = inf.data.imnsName ?? defaultDash
        dateRegistrtionOut.text = converseDateToString(inf.data.mnsRegDate)
        dateLiqudationOut.text = converseDateToString(inf.data.eliminationDate)
        clientAdress.text = optionalRemoveForIntStr(inf.data.address ).replacingOccurrences(of: "&quot;", with: "")
        setupColorForStatus(clientStatusOut, inf.data.statusMns ?? defaultDash)
        
        //MARK - set EGR
        egrCodeOut.text = optionalRemoveForIntStr(inf.data.egrRegOgrCode)
        nameEgrOrganOut.text = inf.data.egrRegOgrName ?? defaultDash
        dateRegistrationEgrOut.text = converseDateToString(inf.data.egrRegDate)
        dateExitFromEgrOut.text = converseDateToString(inf.data.egrEliminationDate)
        statusCodeEgrOut.text = optionalRemoveForIntStr(inf.data.egrStatusCode)
        setupColorForStatus(statusCodeEgrOut, statusCodeEgrOut.text)
        egrStatusOut.text = optionalRemoveForIntStr(inf.data.egrStatusName)
        setupColorForStatus(egrStatusOut, egrStatusOut.text)
        blrNameClient.text = inf.data.egrNameBel ?? defaultDash
        shortBlrNameOut.text = inf.data.egrName ?? defaultDash
        
        //MARK EGR - subjectHistory
        if !inf.data.egrSubjectHistory.isEmpty {
            historyChangingInEgrOut.text?.removeAll()
        inf.data.egrSubjectHistory.forEach({ element in
        let item = "Дата: \(converseDateToString(element?.date)),\nКомментарий: \(optionalRemoveForIntStr(element?.info))\n\n"
            historyChangingInEgrOut.text? += arrayParcing(item)  })
        } else {
            historyChangingInEgrOut.text? = defaultDash
        }

        //MARK - Finance
        let sum = sumFormat(inf.data.charterCapital, nil)
        fondSummOut.text = optionalRemoveForIntStr(sum)
        valuteCodeOut.text = optionalRemoveForIntStr(inf.data.charterCapitalCurrency)
        vetoOnSaleOut.text = inf.data.ambargo ?? false ? "Да" : "Нет"
        setupColorForStatus(vetoOnSaleOut, vetoOnSaleOut.text)

        //MARK - WritInfo
        creditorWritOut.text = optionalRemoveForIntStr(inf.data.writ?.creditor)
        debitorWritOut.text = optionalRemoveForIntStr(inf.data.writ?.debtor)

        //MARK - CourtsSessions
        creditorCourtOut.text = optionalRemoveForIntStr(inf.data.courtSessions?.creditor)
        debitorCourtOut.text = optionalRemoveForIntStr(inf.data.courtSessions?.debtor)

        //MARK - Executory
        debitorExecutoryOut.text = optionalRemoveForIntStr(inf.data.executory?.debtor)
        
        //MARK - imnsDebtorsFirstDay
        if !inf.data.imnsDebtors.isEmpty {
            imnsDebtorsFirstDayOut.text?.removeAll()
           inf.data.imnsDebtors.forEach( { element in
                let item = "Дата: \(converseDateToString(element?.date)),\nГород: \(optionalRemoveForIntStr(element?.city))\n\n"
                imnsDebtorsFirstDayOut.text? += arrayParcing(item) })
        } else { imnsDebtorsFirstDayOut.text? = ClientStatus.notAvailable }
        setupColorForStatus(imnsDebtorsFirstDayOut, imnsDebtorsFirstDayOut.text)
        
        //MARK - IMNSDebtorsInMonth
        if !inf.data.imnsDebtorsInMonth.isEmpty {
            imnsDebtorsInMonthOut.text?.removeAll()
            inf.data.imnsDebtorsInMonth.forEach({ element in
            let item = "Дата: \(converseDateToString(element?.date)),\nКод: \(optionalRemoveForIntStr(element?.mnsCode)).\n\n"
                imnsDebtorsInMonthOut.text? += arrayParcing(item) })
        } else { imnsDebtorsInMonthOut.text = ClientStatus.notAvailable }
        setupColorForStatus(imnsDebtorsInMonthOut, imnsDebtorsInMonthOut.text)

        //MARK - socialSecurityFound
        if !inf.data.socialSecurityFound.isEmpty {
            socialSecurityFoundOut.text?.removeAll()
        inf.data.socialSecurityFound.forEach({ element in
            let sum = element?.sum
            let item = "Cумма: \(sumFormat(nil, sum)),\nДата: \(converseDateToString(element?.date)).\n\n"
            socialSecurityFoundOut.text? += arrayParcing(item)})
        } else { socialSecurityFoundOut.text = ClientStatus.notAvailable }
        setupColorForStatus(socialSecurityFoundOut, socialSecurityFoundOut.text)
        
        //bankruptstvo
        dealNumberOut.text? = inf.data.bankruptcy?.dealNumber ?? defaultDash
        processCodeOut.text? = optionalRemoveForIntStr(inf.data.bankruptcy?.processCode)  
        processNameOut.text? = inf.data.bankruptcy?.processName ?? defaultDash
        startDateOut.text? = converseDateToString(inf.data.bankruptcy?.startDate)
        closeDateOut.text? = converseDateToString(inf.data.bankruptcy?.closeDate)
        statusOut.text? = inf.data.bankruptcy?.status ?? false ? "Да" : "Нет"
        setupColorForStatus(statusOut, statusOut.text)
        
        //RISK
        riskReasonOut.text? = inf.data.risk?.reason ?? defaultDash
        dateRiskOut.text = converseDateToString(inf.data.risk?.date)
        
        //Liqudation
        decisionDateOut?.text = converseDateToString(inf.data.liquidation?.decisionDate)
        liqFioOut?.text = inf.data.liquidation?.liqFio ?? defaultDash
        liqAddressOut?.text = inf.data.liquidation?.liqAddress ?? defaultDash
        liqPhoneOut?.text = inf.data.liquidation?.liqPhone ?? defaultDash
        decisionTermOut?.text = optionalRemoveForIntStr(inf.data.liquidation?.decisionTerm)
        publishDateOut?.text = converseDateToString(inf.data.liquidation?.publishDate)
        currentStatusOut?.text = inf.data.liquidation?.currentStatus ?? defaultDash
        
        //Checks
        if !inf.data.checks.isEmpty {
            checkInMonthOut?.text?.removeAll()
            inf.data.checks.forEach { element in
                let item = "Количество проверок в месяц: \(optionalRemoveForIntStr(element?.checksInMonth) ),\nМесяц проверки: \(optionalRemoveForIntStr(element?.month) ),\nГод проверки: \(optionalRemoveForIntStr(element?.year)).\n\n"
                checkInMonthOut?.text? += arrayParcing(item) }
            
        } else { checkInMonthOut?.text = defaultDash }
            
        //DisqualifiedProvidersInfo
        descriptionOut.text = inf.data.disqualifiedProviders?.description ?? defaultDash
        excDescription.text = inf.data.disqualifiedProviders?.excDescription ?? defaultDash
        
        //Certs[]
        if !inf.data.certs.isEmpty {
            certsOut.text?.removeAll()
            inf.data.certs.forEach { element in
                let item = "Код типа сертификации: \(optionalRemoveForIntStr(element?.code)),\nТип сертификации: \(optionalRemoveForIntStr(element?.type)),\nКоличество сертификатов: \(optionalRemoveForIntStr(element?.quantity))\n\n"
                certsOut.text? += arrayParcing(item)
            }
        } else { certsOut.text = defaultDash }
        
        //CharterCapitalChangesInfo
        let newChapterCap = sumFormat(inf.data.charterCapitalChanges?.newCharterCapital, nil)
        newCharterCapitalOut.text = optionalRemoveForIntStr(newChapterCap)
        decreeDateOut.text = converseDateToString(inf.data.charterCapitalChanges?.decreeDate)
        publishDateCapitalChangesOut.text = converseDateToString(inf.data.charterCapitalChanges?.publishDate)
        
        //TradesInfo
        let customerSum = sumFormat(nil, inf.data.trades?.customer?.sumByn)
        let providerSum = sumFormat(nil, inf.data.trades?.provider?.sumByn)
        customerOut.text = "Количество договоров: \(optionalRemoveForIntStr(inf.data.trades?.customer?.quantity)),\nОбщая сумма в бел.рублях: \(optionalRemoveForIntStr(customerSum))"
        providerOut.text = "Количество договоров: \(optionalRemoveForIntStr(inf.data.trades?.provider?.quantity)),\nОбщая сумма в бел.рублях: \(optionalRemoveForIntStr(providerSum))"
         
        //BanksGuaranteesInfo
        principalOut.text = optionalRemoveForIntStr(inf.data.banksGuarantees?.principal)
        beneficiaryOut.text = optionalRemoveForIntStr(inf.data.banksGuarantees?.beneficiary)
        
        //BelcciInfo
        managerBelccOut.text = inf.data.belcci?.manager ?? defaultDash
        emailBelccOut.text = inf.data.belcci?.email ?? defaultDash
        siteBelccOut.text = inf.data.belcci?.site ?? defaultDash
        phoneBelccOut.text = inf.data.belcci?.phone ?? defaultDash
        
        //FezInfo
        nameFezInfoOut.text = inf.data.fez?.name ?? defaultDash
        projectFezInfoOut.text = inf.data.fez?.project ?? defaultDash
        
        //Auctions[]
        if !inf.data.auctions.isEmpty {
            auctionsOut.text?.removeAll()
            inf.data.auctions.forEach { element in
                let item = "Статус закупки: \(optionalRemoveForIntStr(element?.status)),\nКоличество закупок: \(optionalRemoveForIntStr(element?.quantity))"
                auctionsOut.text? += arrayParcing(item)
            }
        } else { auctionsOut.text = defaultDash }
        
        //TrademarksInfo
        quantityTrademarksOut.text = optionalRemoveForIntStr(inf.data.trademarks?.quantity)
        
        //CertsOfConfInfo
        quantityCertsOfConf.text = optionalRemoveForIntStr(inf.data.certsOfConf?.quantity)
            }
}

        

