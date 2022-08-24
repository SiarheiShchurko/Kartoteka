//
//  ProfileVC.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 27.06.22.
//

import UIKit

class ProfileVC: UIViewController {
    var profileVM: ProfileModelProtocol = ProfileModel()
    
    
    @IBOutlet private weak var headerView: UIView! {
        didSet {  setColorSize(headerView) }
    }
    @IBOutlet private weak var headerLabel: UILabel! {
        didSet {  setupForHeaderViewLabel(headerLabel) }
    }
    
    //MARK: Label Name
    @IBOutlet private weak var nameLabelOut: UILabel!
    
    //MARK: Label secondName
    @IBOutlet private weak var secondNameLabelOut: UILabel! 
    
    //MARK: Label Token
    @IBOutlet private weak var actualTokenLabelOut: UILabel!
    
    //MARK: All Labels collection
    @IBOutlet var labelCollectionsOut: [UILabel]! {
        didSet {
            labelCollectionsOut.forEach( { label in setupForLabelScreenSize(label) } ) }
    }
    
    //MARK: TF Name
    @IBOutlet private weak var tfNameOut: UITextField! {
        didSet {
            tfNameOut.delegate = self
            let userDefaults = UserDefaults.standard
               tfNameOut.text = userDefaults.string(forKey: Profile.ProfileKeys.kName)
               tfNameOut.attributedPlaceholder = NSAttributedString(string: "Введите ваше имя", attributes: [.font: UIFont.systemFont(ofSize: tfNameOut.bounds.size.height / standartPlaceholderFont, weight: .regular) ]) }
    }
    
    //MARK: TF Secondname
    @IBOutlet private weak var tfSecondNameOut: UITextField! {
        didSet {
            tfSecondNameOut.delegate = self
         let userDefaults = UserDefaults.standard
            tfSecondNameOut.text = userDefaults.string(forKey: Profile.ProfileKeys.kSecondName)
            tfSecondNameOut.attributedPlaceholder = NSAttributedString(string: "Введите вашу фамилию", attributes: [.font: UIFont.systemFont(ofSize: tfSecondNameOut.bounds.size.height / standartPlaceholderFont, weight: .regular) ])
            }
        }
    
    //MARK: TF Token
    @IBOutlet private weak var tfActualOut: UITextField! {
        didSet {
            tfActualOut.delegate = self
         let userDefaults = UserDefaults.standard
            tfActualOut.text = userDefaults.string(forKey: Profile.ProfileKeys.token)
            tfActualOut.attributedPlaceholder = NSAttributedString(string: "Введите актуальный токен", attributes: [.font: UIFont.systemFont(ofSize: tfActualOut.bounds.size.height / standartPlaceholderFont, weight: .regular) ]) }
    }
    
    //MARK: TF collections Out
    @IBOutlet var tfCollectionsOut: [UITextField]!
    
    //MARK: Button outlet - "Save/Change settings"
    @IBOutlet  weak var saveButtonOut: UIButton! {
        didSet { setupForbuttonsScreenSize(saveButtonOut) }
    }
    
    //MARK: Button outlet - "Request history"
    @IBOutlet weak var searchHistoryButtonOut: UIButton! {
       didSet { setupForbuttonsScreenSize(searchHistoryButtonOut) }
}
    
    //MARK: Hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Running for set button save/change and set for design TF collection
        designButtonForLoadDisplay()
    }
    
    //MARK: Action/TFCollection - User can save changed if only all 3 TF completed
    @IBAction func tfCollectionAction(_ sender: UITextField) {
      let isEmpty = (tfNameOut.text?.isEmpty ?? true || tfSecondNameOut.text?.isEmpty ?? true || tfActualOut.text?.isEmpty ?? true)
        saveButtonOut.isEnabled = !isEmpty
        
        //Assign value for TF:
        switch sender {
            //Name
        case tfNameOut: tfNameOut.text = sender.text
            //SecondName
        case tfSecondNameOut: tfSecondNameOut.text = sender.text
            //Actual token
        case tfActualOut: tfActualOut.text = sender.text
            
        default: break
    }
}
    //MARK: Action/Button - "Save/Changed"
    @IBAction func saveButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? profileVM.saveProfileSettings(tfNameOut, tfSecondNameOut, tfActualOut, tfCollectionsOut) : changedProfileSettings()
       
}
    
    //MARK: Action/Button - "Request History"
    @IBAction func histotyButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "\(HistoryViewsVC.self)") as? HistoryViewsVC else { return }
        navigationController?.present(nextVC, animated: true)
        
    }
    //MARK: Design button "save/change" and TF, when app starting
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
    //MARK: func for update UI elements if user press buttons "Change"
    func changedProfileSettings() {
        tfCollectionsOut.forEach { element in
            element.textColor = .label
            element.isEnabled = true
        }
    }
}

//MARK: - Firstresponder Settings
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


