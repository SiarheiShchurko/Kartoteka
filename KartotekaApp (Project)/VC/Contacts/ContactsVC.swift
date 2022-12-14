//
//  ContactsCompanyVC.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 30.06.22.
//

import UIKit
import MessageUI
import MapKit

//MARK: Protocol for notification for move UI when user press on TF
protocol NotiProtocol {
    
    func registerForKeyboardNotications()
    func removeKeyBoardNotifications()
    func kbWillShow(_ notification: Notification)
    
}

class ContactsCompanyVC: UIViewController  {
    
    //MARK: VM var
    private var contactsModel: ContactsProtocol = ContactsVM()
    
    //MARK: ScrollView
    @IBOutlet weak var scrollViewOut: UIScrollView!
    
    //MARK: HeaderView
    @IBOutlet private weak var headerView: UIView! {
        didSet { setColorSize(headerView)}
    }
    
    //MARK: "Contacts block"
    @IBOutlet weak var firstBlockOut: UIView!
    
    //MARK: - Views First Block (Contacts block), Second Block and Map Block. Corner radius set.
    @IBOutlet var viewsCollectionOut: [UIView]! {
        didSet { viewsCollectionOut.forEach({ elementView in
                elementView.layer.cornerRadius = cornerRadius }) }
    }
    
    //MARK: MapView
    @IBOutlet weak var mapOut: MKMapView! {
        didSet { contactsModel.mapService(mapOut) }
    }
           
    //MARK: - Label "Contacts in HeaderView"
    @IBOutlet private weak var headerLabel: UILabel! {
        didSet {
            setupForHeaderViewLabel(headerLabel)
        }
    }
    
    //MARK: - Label Font settings. We have 3 variant fonts. Header - Times Roman. Start words in row - system bold. Other words who not include in array writing standart text.
    @IBOutlet var labelsCollectionOut: [UILabel]! {
        didSet { labelsCollectionOut.forEach({label in
               setupForLabelScreenSize(label)
                let arrayBoldTitle = ["Контакты", "Отдел продаж:", "Бухгалтерия:", "Viber/Telegram:", "Сайт:", "E-mail:", "Время работы", "Наши реквизиты", "Понедельник-пятница:", "Обед:", "Выходные:", "Адрес:", "Счет:", "БИК/BIC:", "Адрес банка:", "Мы здесь"]
                for item in arrayBoldTitle {
                    if label.text == "Контакты" ||
                       label.text == "Время работы" ||
                       label.text == "Наши реквизиты" {
                       label.font = UIFont.init(name: "Times New Roman", size: label.bounds.size.height / 4.0)
                    } else if label.text == item {
                        label.font = UIFont.systemFont(ofSize: label.bounds.size.height / standartFontSize, weight: .bold) } } })
        }
    }
    
    //MARK: TF "nameTextFieldOut"
    @IBOutlet private weak var nameTextFieldOut: UITextField! {
        didSet { nameTextFieldOut.delegate = self
            nameTextFieldOut.attributedPlaceholder = NSAttributedString(string: "Введите ваше имя", attributes: [.font: UIFont.systemFont(ofSize: nameTextFieldOut.bounds.size.height / standartPlaceholderFont, weight: .regular) ]) }
    }
    
    //MARK: TF "emailTextFieldOut"
    @IBOutlet private weak var emailTextFieldOut: UITextField! {
        didSet { emailTextFieldOut.delegate = self
            emailTextFieldOut.attributedPlaceholder = NSAttributedString(string: "Введите ваш е-мейл", attributes: [.font: UIFont.systemFont(ofSize: emailTextFieldOut.bounds.size.height / standartPlaceholderFont, weight: .regular)]) }
    }
    
    //MARK: TF "messageTextFieldOut"
    @IBOutlet private weak var messageTextFieldOut: UITextField! {
        didSet {
            messageTextFieldOut.delegate = self
            let sizeFontThisObject = messageTextFieldOut.bounds.size.height * 2.0
            messageTextFieldOut.bounds.size.height = sizeFontThisObject
            messageTextFieldOut.attributedPlaceholder = NSAttributedString(string: "Введите ваше сообщение", attributes: [.font: UIFont.systemFont(ofSize: emailTextFieldOut.bounds.size.height / standartPlaceholderFont, weight: .regular)]) }
    }
    
    //MARK: Button "Sent message"
    @IBOutlet weak var firstBlockButtonOut: UIButton! {
        didSet { setupForbuttonsScreenSize(firstBlockButtonOut) }
    }
    
    //MARK: Hide keyboard func
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
          view.endEditing(true)
  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK - return backgroundColor for tabBar
        tabBarController?.tabBar.backgroundColor = .systemBackground
        
        //MARK - used yeallowCorporativeColor for backgroundColor view because when user scrolling display, some space background have white color.
        view.backgroundColor = yeallowCorporativeColor
        
        //MARK - Notification func for keyboard
        registerForKeyboardNotications()
    }
    
    deinit {
        removeKeyBoardNotifications()
    }
    
    //MARK: Action - Work TF-collections. Editingchanged for enabled "sent message" button
    @IBAction func tfCollectionsAct() {
        let isEmpty = (nameTextFieldOut.text?.isEmpty ?? true) ||
        (emailTextFieldOut.text?.isEmpty ?? true) || (messageTextFieldOut.text?.isEmpty ?? true)
        firstBlockButtonOut.isEnabled = !isEmpty
}

    
    //MARK: Action - Email sending
    @IBAction private func sendMessageAct(_ sender: UIButton) {
        
        //MARK - Save data entered by user in struct
        contactsModel.user = ModelUser.init(name: nameTextFieldOut.text, email: emailTextFieldOut.text, message: messageTextFieldOut.text)
        
        //MARK - Call emailService func
        contactsModel.sentMessage()
        
        //MARK - Removed all text out from textField
        nameTextFieldOut.text?.removeAll()
        emailTextFieldOut.text?.removeAll()
        messageTextFieldOut.text?.removeAll()
        firstBlockButtonOut.isEnabled = false
        
        //MARK - Alert about successfull sending
        let alert = UIAlertController(title: "Cообщение отправлено", message: nil, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: "Ok", style: .default) { _ in
            alert.dismiss(animated: true)}
            alert.addAction(buttonOk)
            present(alert, animated: true)
        }
}

//MARK: TF Delegate methods for firstResponder
extension ContactsCompanyVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {  ///Этот метод срабатывает после нажатие на кнопку "enter/return".
        if nameTextFieldOut == textField { emailTextFieldOut.becomeFirstResponder() ///После нажатия на enter/return - FirstResponderом будет secondOutlet, соотвтетственно курсор будет перемещен на второй текст филд.
        } else if emailTextFieldOut == textField {
            messageTextFieldOut.becomeFirstResponder() ///После нажатия enter/return на следующем текст филд, ферст респондером будет следующий и курсор перескачет туда.
        } else {
            messageTextFieldOut.resignFirstResponder() ///Когда мы доберемся до крайнего текст филда и нажмем enter/return - мы снимем ферст респондера с крайнего текст филда. Клавиатура закроется, курсор исчезнет.
        }
        return true
    }
}

//MARK: Notification for keyboard. When keyboard showed, UI moving by the size of keyboard.
extension ContactsCompanyVC: NotiProtocol {
    
    func registerForKeyboardNotications() {
       NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
   }
   func removeKeyBoardNotifications() {
       NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillHideNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
   }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        scrollViewOut.contentOffset = CGPoint(x: 0.0, y: kbFrameSize?.height ?? 0.0)
    }

    @objc func kbWillHide() {
        scrollViewOut.contentOffset = CGPoint.zero
    }
    
}



    

