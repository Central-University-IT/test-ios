//
//  FavoritesManager.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 14.02.2024.
//

import Foundation
import ProdMobileCore

public protocol IFavoritesDelegate: AnyObject {
    func favoritesDidChanged()
}

struct FavoritesModel: Identifiable {
    let identifier: String
}

public protocol IFavoritesManager {
    /// Возвращает сохраненные айдишники офферов из избранного
    var favorites: [String] { get }
    /// Возвращает количество офферов в избранном
    var favoritesCount: Int { get }
    /// Метод подписки на уведомления об изменении  данных в избранном
    func subscribe(_ delegate: IFavoritesDelegate)
    /// Добавление в избранное
    func likeOffer(with id: String)
    /// Удаление из избранного
    func unlikeOffer(with id: String)
}

final class FavoritesManager: IFavoritesManager {
    
    // Dependencies
    private var delegateList: [WeakFavoritesDelegate] = []
    private let storage: IPersistenceStorage
    private let dataBaseQueue = DispatchQueue(label: "storage", qos: .default)

    init(storage: IPersistenceStorage) {
        self.storage = storage
    }

    var favorites: [String] {
        // --TODO--
    }
    
    var favoritesCount: Int {
        favorites.count
    }

    func subscribe(_ delegate: IFavoritesDelegate) {
        // --TODO--
    }

    func likeOffer(with id: String) {
        // --TODO--
    }

    func unlikeOffer(with id: String) {
        // --TODO--
    }

}

struct WeakFavoritesDelegate {
    weak var value: IFavoritesDelegate?

    init(_ value: IFavoritesDelegate?) {
        self.value = value
    }
}
