//
//  SentEmailService.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 1.08.22.
//


import UIKit
import MessageUI

struct ModelUser {
    var name: String?
    var email: String?
    var message: String?
}

class SentMailServices: UIViewController {
    var name = ""
    var email = ""
    var message = ""
    
    
    func sentMessage(_ userInfo: ModelUser) {
        self.name = userInfo.name ?? "."
        self.email = userInfo.email ?? "."
        self.message = userInfo.message ?? "."
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
        print(name)
        print(email)
        print(message)
    return mailComposeVC
        
    }
}

extension SentMailServices: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
