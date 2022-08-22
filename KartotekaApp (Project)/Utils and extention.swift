//
//  extension.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 20.06.22.
//

import UIKit




//MARK - setup yeallow view. Color and Size
func setColorSize(_ view: UIView) {
    view.backgroundColor = yeallowCorporativeColor
    view.frame.size.width = screenWidth
    view.frame.size.height = headerViewSize
}

func setForSmallHeaderView(_ view: UIView) {
    view.backgroundColor = yeallowCorporativeColor
    view.frame.size.width = screenWidth
    view.frame.size.height = heightForSmallHeaderView
}

//MARK - Default values

let defaultDash = "-"
let defaultApsent = "Отсутствует"

//Mark Header label size extension
let standartFontSize = 7.3
let standartPlaceholderFont = 2.0
let cornerRadius = 10.0
let headerViewSize = UIScreen.main.bounds.width / 1.8
let screenWidth = UIScreen.main.bounds.width
let yeallowCorporativeColor = UIColor(red: 1, green: 0.87, blue: 0.2, alpha: 1)
let heightForSmallHeaderView = UIScreen.main.bounds.height / 10.0

func setupForHeaderViewLabel(_ label: UILabel) {
    label.frame.size.width = UIScreen.main.bounds.width
    let sizeFontThisLabel = UIScreen.main.bounds.height / 30
    label.font = UIFont(name: "Times New Roman", size: sizeFontThisLabel)
}

func setupForLabelScreenSize(_ label: UILabel) {
    label.frame.size.height = UIScreen.main.bounds.height / standartFontSize
    label.font = UIFont.systemFont(ofSize: label.bounds.size.height / standartFontSize)
}

func placeholderSize(_ placehold: UITextField) {
    placehold.attributedPlaceholder = NSAttributedString(string: "", attributes: [.font: UIFont.systemFont(ofSize: placehold.bounds.size.height / 1.5, weight: .regular) ])
}

func blueButtonSet(_ button: UIButton) {
    
        button.layer.cornerRadius = cornerRadius
    button.frame.size.height = UIScreen.main.bounds.height / standartFontSize
        let sizeFontThisButton = button.bounds.size.height / 5.0
        button.titleLabel?.font =  UIFont.init(name: "Verdana-Bold", size: sizeFontThisButton)
    
    //button.titleLabel?.adjustsFontForContentSizeCategory = true
   
    }

func setupForbuttonsScreenSize(_ button: UIButton) {
    button.layer.cornerRadius = cornerRadius
    button.frame.size.height = UIScreen.main.bounds.height / standartFontSize
    button.titleLabel?.font = UIFont.init(name: "Verdana-Bold", size: button.bounds.size.height / standartFontSize)
}


//Mark - func for setup countryLabel in second textField
//func setupForCountrysList(info: Settings, label: UILabel) {
//    let notActive = " (Недоступно)"
//    let country = "Беларусь"
//    if info.countryChanged == country || label.text == country {
//        label.textColor = .blue
//    } else {
//        label.text! += notActive
//        label.textColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
//        
//    }
//}



//func tfPlaceholderSet(_ textFild: UITextField!) {
//    var profile: ProfileVC?
//            switch textFild {
//            case profile?.tfNameOut:
//                let userDefaults = UserDefaults.standard
//                profile?.tfNameOut.text = userDefaults.string(forKey: Profile.ProfileKeys.kName)
//                profile?.tfNameOut.attributedPlaceholder = NSAttributedString(string: "Введите ваше имя ", attributes: [.font: UIFont.systemFont(ofSize: (profile?.tfNameOut.bounds.size.height ?? 20.0) / 1.5, weight: .regular) ])
//            default: break
//        }
//    }

//MARK - Converse date to string with optional
func converseDateToString(_ inf: Date?) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if let date = inf {
    return dateFormatter.string(from: date)
    }
return "-"
}

//MARK - value for clients status MNS
enum ClientStatus {
    static let working = "Действующий"
    static let working1 = "1"
    static let notAvailable = "Отсутствует"
    static let no = "Нет"
    static let yes = "Да"
    static let liqudation = "Ликвидирован"
    static let liqudationProccesing = "В процессе ликвидации"
    static let liqudationNominant = "Представлен к ликвидации"
    static let egrLoss = "Исключен из ЕГР"
    static let liqudationProccesingNow = "Находится в процессе ликвидации"
    static let bankrutptsy = "Процедура банкротства"
    static let bankrutptsyMNS = "В процедуре банкротства"
    static let reorganization = "Прекращение деятельности в результате реорганизации"
    static let stopBussines = "Приостановлена деятельность"
    static let lossLaw = "Утрата правоспособности"
}
func setupColorForStatus(_ label: UILabel, _ text: String? )  {
    if let labText = text {
        label.text = labText
    switch label.text {
    case ClientStatus.working, ClientStatus.working1, ClientStatus.notAvailable, ClientStatus.no:
        label.textColor = .systemGreen
    case ClientStatus.yes, ClientStatus.liqudation, ClientStatus.liqudationProccesing, ClientStatus.liqudationProccesingNow, ClientStatus.liqudationNominant, ClientStatus.egrLoss, ClientStatus.bankrutptsy, ClientStatus.bankrutptsyMNS, ClientStatus.reorganization, ClientStatus.stopBussines, ClientStatus.lossLaw:
        label.textColor = .systemRed
    default: label.textColor = .label
    }
    }
}
func optionalRemoveForIntStr<T: Any>(_ int: T?) -> String {
    if let str = int {
     return "\(str)"
    }
    return defaultDash
}




func arrayParcing(_ elementParcing: String?) -> String {
    var sum = ""
    if let item = elementParcing {
        sum += item
    }
    return sum
}

func sumFormat(_ str: Int?, _ float: Float? ) -> String {
    if let strg = str {
        let formatter = NumberFormatter()
            let number = NSNumber(value: strg)
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            let formattedString = formatter.string(from: number) ?? "-"
            return formattedString
        
    } else if let flt = float {
        let formatter = NumberFormatter()
            let number = NSNumber(value: flt )
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            let formattedString = formatter.string(from: number) ?? "-"
            return formattedString
        
    }
    return defaultDash
    }
 // Check errors for loading information about client






