//
//  ViewController.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 20.06.22.
//

import UIKit


protocol ProtTest {
    
}
class RootVC: UIViewController {
    
    @IBOutlet weak var changedCountryLabelOut: UILabel! {
        didSet { let userDefaults = UserDefaults.standard
            changedCountryLabelOut.text = userDefaults.string(forKey: CountryListVM.KeysForDefaults.selectedCountry) ?? "Беларусь"
                 setupForLabelScreenSize(changedCountryLabelOut)
                 changedCountryLabelOut.textColor = .blue }
    }
    
    @IBOutlet private weak var headerView: UIView! {
        didSet { setColorSize(headerView) }
    }
    
    @IBOutlet private weak var checkContragentsServiceLabel: UILabel! {
        didSet { checkContragentsServiceLabel.text = "Сервис проверки \n контрагентов"
            setupForHeaderViewLabel(checkContragentsServiceLabel)
        }
    }
    
    @IBOutlet private weak var textFieldOut: UITextField! {
        didSet {
            textFieldOut.delegate = self
            textFieldOut.attributedPlaceholder = NSAttributedString(string: "Введите УНП контрагента ", attributes: [.font: UIFont.systemFont(ofSize: textFieldOut.bounds.size.height / standartPlaceholderFont , weight: .regular) ])
        }
    }
    
    @IBOutlet private weak var textFieldOut2: UITextField!
    
    //MARK: - button Search
    @IBOutlet private weak var searchButton: UIButton! {
        didSet  { blueButtonSet(searchButton)
            searchButton.isEnabled = false }
    }
    
    @IBOutlet private weak var kartotecaReloadOut: UILabel! {
        didSet { setupForLabelScreenSize(kartotecaReloadOut) }
    }
    
    @IBOutlet weak var infoLabeleOut: UILabel! {
        didSet { infoLabeleOut.text = "Самая достоверная информация\n из надежных источников"
            let sizeFontThisLabel = UIScreen.main.bounds.height / 45
            infoLabeleOut.font = UIFont(name: "Times New Roman", size: sizeFontThisLabel) }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
 
    
    @IBAction func countryChangedAct(_ sender: UIButton) {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      guard let nextVC = storyboard.instantiateViewController(withIdentifier: "\(CountryListVC.self)") as? CountryListVC else { return }
     nextVC.delegate = self
     navigationController?.present(nextVC, animated: true)
    }
    

    
    //MARK - Action after press "Search" button
    @IBAction func searchAct() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
             guard let nextVC = storyboard.instantiateViewController(withIdentifier: "\(SearchResultVC.self)") as? SearchResultVC else { return }
            present(UINavigationController(rootViewController: nextVC), animated: true)
        }
    
    
    @IBAction private func textFieldChanged(sender: UITextField!) {
        RootVM.unp = Int(sender.text ?? "0")
        if sender.text?.count == 9 {
            searchButton.isEnabled = true
        } else {
            searchButton.isEnabled = false
        }
    }
}

//MARK - Delegate method for show changed country in second TextFild

extension RootVC: GetInfoDelegate {
    func getInfo(_ info: Settings) {
        changedCountryLabelOut.text = info.countryChanged
    }
}

extension RootVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let numberOnly = NSCharacterSet.init(charactersIn: "0123456789")
            let stringFromTextField = NSCharacterSet.init(charactersIn: string)
            let strValid = numberOnly.isSuperset(of: stringFromTextField as CharacterSet)
               return strValid
         }
        }
    
    
    






