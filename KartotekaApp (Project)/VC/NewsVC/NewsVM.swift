//
//  NewsVM.swift
//  Kartoteka.by
//
//  Created by Alinser Shchurko on 16.08.22.
//

import Foundation
import UIKit

struct ModalNews {
    var newsName: String?
    var image: UIImage?
    var url: URL?
}

protocol NewsProtocol {
    var newsArray: [ModalNews] { get }
    func openNews(_ link: ModalNews)
}

final class NewsVM: NewsProtocol {
  
    //MARK: - array news
    var newsArray: [ModalNews] = [ModalNews(newsName: "Финансовая отчетность белорусских компаний", image: UIImage(named: "1"), url: URL(string: "https://kartoteka.by/blog/bybalance")), ModalNews(newsName: "​Обновлены 3 реестра данных Республики Беларусь", image: UIImage(named: "2"), url: URL(string: "https://kartoteka.by/blog/by030219")), ModalNews(newsName: "Расширен перечень реестров для проверки благонадежности контрагентов в Казахстане", image: UIImage(named: "3"), url: URL(string: "https://kartoteka.by/blog/kz280119")), ModalNews(newsName: "Черная пятница - единые скидки 30%", image: UIImage(named: "4"), url: URL(string: "https://kartoteka.by/blog/bf2018")), ModalNews(newsName: "Чат-бот Картотека в популярном мессенджере Telegram", image: UIImage(named: "5"), url: URL(string: "https://kartoteka.by/blog/chat-bot-telegram")), ModalNews(newsName: "«Сдайте» злостных неплательщиков и поддержите добрым словом надежных и проверенных контрагентов!!", image: UIImage(named: "6"), url: URL(string: "https://kartoteka.by/blog/blacklist-new-function")), ModalNews(newsName: "Внимание! Новая услуга: «Расширенная бизнес-справка о компании»", image: UIImage(named: "7"), url: URL(string: "https://kartoteka.by/blog/vypiska_iz_egr_business-spravka")), ModalNews(newsName: "Новый функционал для пользователей пакета Доступ и Мониторинг", image: UIImage(named: "8"), url: URL(string: "https://kartoteka.by/blog/new-function-for-users")), ModalNews(newsName: "Уставной фонд ООО Щебтрейд уменьшается. Срок предъявления претензий - до 21 апреля 2016г.", image: UIImage(named: "9"), url: URL(string: "https://kartoteka.by/blog/ustavnoi-fond-ooo-schebtreid-unp-690661262-umenshaetsa")), ModalNews(newsName: "В услугу Мониторинг добавлено 7 новых каналов", image: UIImage(named: "10"), url: URL(string: "https://kartoteka.by/blog/monitoring_expansion"))]
    
    //MARK: Func for load news to app
    func openNews(_ link: ModalNews) {
        guard let url = link.url else { return }
        UIApplication.shared.open(url)
    }
}
