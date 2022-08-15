//
//  SentEmailService.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 1.08.22.
//


import UIKit
import MessageUI

class SentMailServices: UIViewController {
    var name = ""
    var email = ""
    var message = ""
    
    
    func sentMessage(_ name: UITextField, _ email: UITextField, _ message: UITextField) {
        self.name = name.text ?? ""
        self.email = email.text ?? ""
        self.message = message.text ?? ""
    let mailComposeViewController = configureMailComposer()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            print("Can't send email")
        }
    }
    func configureMailComposer() -> MFMailComposeViewController {
    let mailComposeVC = MFMailComposeViewController()
    mailComposeVC.mailComposeDelegate = self
    mailComposeVC.setToRecipients(["pridemc@yandex.ru"])
        mailComposeVC.setSubject("Запрос через приложение Картотека IOS")
        mailComposeVC.setMessageBody("Cообщение: \(self.message)\n Имя клиента: \(self.name)\n Емейл клиента: \(self.email)", isHTML: false)
        //print(name)
       // print(email)
       // print(message)
    return mailComposeVC
        
    }
}

extension SentMailServices: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
