//
//  NotificationsService.swift
//  KartotekaApp (Project)
//
//  Created by Alinser Shchurko on 12.07.22.
//

import Foundation
import UIKit

//MARK - Service for keyboard. When keyboard show - userinterface which need now for user migration up to user can look it.

final class NotiService: UIViewController {
    
    var contacts: ContactsCompanyVC?
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
            contacts?.scrollViewOut.contentOffset = CGPoint(x: 0.0, y: kbFrameSize?.height ?? 0.0)
        }
    
        @objc func kbWillHide() {
            contacts?.scrollViewOut.contentOffset = CGPoint.zero
        }
}
