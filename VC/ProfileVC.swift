//
//  ProfileVC.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 27.06.22.
//

import UIKit

class ProfileVC: UIViewController {
    
    var profileModel = Profile()
    
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var headerLabel: UILabel! {
        didSet {  setupForHeaderViewLabel(headerLabel) }
    }
    
    @IBOutlet private weak var nameLabelOut: UILabel!
    @IBOutlet weak var tfNameOut: UITextField! {
        didSet {
            tfNameOut.delegate = self
            let userDefaults = UserDefaults.standard
               tfNameOut.text = userDefaults.string(forKey: Profile.ProfileKeys.kName)
               tfNameOut.attributedPlaceholder = NSAttributedString(string: "Введите ваше имя", attributes: [.font: UIFont.systemFont(ofSize: tfNameOut.bounds.size.height / standartPlaceholderFont, weight: .regular) ])
        }
    }
    @IBOutlet private weak var secondNameLabelOut: UILabel! 
    @IBOutlet weak var tfSecondNameOut: UITextField! {
        didSet {
            tfSecondNameOut.delegate = self
         let userDefaults = UserDefaults.standard
            tfSecondNameOut.text = userDefaults.string(forKey: Profile.ProfileKeys.kSecondName)
            tfSecondNameOut.attributedPlaceholder = NSAttributedString(string: "Введите вашу фамилию", attributes: [.font: UIFont.systemFont(ofSize: tfSecondNameOut.bounds.size.height / standartPlaceholderFont, weight: .regular) ])
            }
        }
    
    @IBOutlet private weak var actualTokenLabelOut: UILabel!
    @IBOutlet weak var tfActualOut: UITextField! {
        didSet {
            tfActualOut.delegate = self
         let userDefaults = UserDefaults.standard
            tfActualOut.text = userDefaults.string(forKey: Profile.ProfileKeys.token)
            tfActualOut.attributedPlaceholder = NSAttributedString(string: "Введите актуальный токен", attributes: [.font: UIFont.systemFont(ofSize: tfActualOut.bounds.size.height / standartPlaceholderFont, weight: .regular) ])
        }
    }
    
    @IBOutlet var labelCollectionsOut: [UILabel]! {
        didSet {
            labelCollectionsOut.forEach( { label in setupForLabelScreenSize(label) } )
        }
    }
    
    @IBOutlet private var tfCollectionsOut: [UITextField]!
                                                 
    @IBOutlet private weak var saveButtonOut: UIButton! {
        didSet {
            setupForbuttonsScreenSize(saveButtonOut) }
    }
    
    @IBOutlet weak var searchHistoryButtonOut: UIButton! {
       didSet {
            searchHistoryButtonOut.layer.cornerRadius = cornerRadius
            blueButtonSet(searchHistoryButtonOut)
        }
}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColorSize(headerView)
        designButtonForLoadDisplay()
    }

    @IBAction func tfCollectionAction(_ sender: UITextField) {

      let isEmpty = (tfNameOut.text?.isEmpty ?? true || tfSecondNameOut.text?.isEmpty ?? true || tfActualOut.text?.isEmpty ?? true)
        saveButtonOut.isEnabled = !isEmpty
        
        switch sender {
        case tfNameOut: tfNameOut.text = sender.text
        case tfSecondNameOut: tfSecondNameOut.text = sender.text
        case tfActualOut: tfActualOut.text = sender.text
        default: break
    }
}
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? saveProfileSettings() : changedProfileSettings()
       
}
    @IBAction func histotyButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "\(HistoryViewsVC.self)") as? HistoryViewsVC else { return }
        navigationController?.present(nextVC, animated: true)
        
    }
    
    func saveProfileSettings() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(tfNameOut.text, forKey: Profile.ProfileKeys.kName)
        userDefaults.set(tfSecondNameOut.text, forKey: Profile.ProfileKeys.kSecondName)
        userDefaults.set(tfActualOut.text, forKey: Profile.ProfileKeys.token)
            tfCollectionsOut.forEach { element in
                element.textColor = .secondaryLabel
                element.isEnabled = false }
    }
    
    func changedProfileSettings() {
        tfCollectionsOut.forEach { element in
            element.textColor = .label
            element.isEnabled = true
        }
    }
 
    
    func designButtonForLoadDisplay() {
        let isEmpty = (tfNameOut.text?.isEmpty ?? true || tfSecondNameOut.text?.isEmpty ?? true || tfActualOut.text?.isEmpty ?? true)
          saveButtonOut.isEnabled = !isEmpty
        if saveButtonOut.isEnabled {
            saveButtonOut.isSelected = true
            tfCollectionsOut.forEach { element in
                element.textColor = .secondaryLabel
                element.isEnabled = false }
    }
}
}
//MARK - Firstresponder change
extension ProfileVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if tfNameOut == textField {
            tfSecondNameOut.becomeFirstResponder()
        } else if tfSecondNameOut == textField {
            tfActualOut.becomeFirstResponder()
        } else {
            tfActualOut.resignFirstResponder()
        }
        return true
    }
}


