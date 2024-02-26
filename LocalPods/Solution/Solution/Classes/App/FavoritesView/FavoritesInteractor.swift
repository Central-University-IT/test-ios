//
//  FavoritesInteractor.swift
//  Solution
//
//  Created by Lada Zudova on 17.02.2024.
//

import Foundation
import UIKit

public protocol IFavoritesInteractor {
    func prepareConfiguration(
        with output: IFavoritesInteractorOutput,
        completion: @escaping (FavoritesViewModel) -> Void
    )
}

public protocol IFavoritesInteractorOutput: AnyObject {
    func update(favoritesViewModel: FavoritesViewModel)
}

final class FavoritesInteractor: IFavoritesInteractor {
    
    // Dependencies
    
    private let favoritesManager: IFavoritesManager
    private weak var output: IFavoritesInteractorOutput?
    
    init(favoritesManager: IFavoritesManager) {
        self.favoritesManager = favoritesManager
        favoritesManager.subscribe(self)
    }
    
    func prepareConfiguration(
        with output: IFavoritesInteractorOutput,
        completion: @escaping (FavoritesViewModel) -> Void
    ) {
        self.output = output
        let badgeCount = favoritesManager.favoritesCount
        completion(
            FavoritesViewModel(
                badgeCount: String(badgeCount)
            )
        )
    }
}

extension FavoritesInteractor: IFavoritesDelegate {
    func favoritesDidChanged() {
        let badgeCount = favoritesManager.favoritesCount

        output?.update(favoritesViewModel: FavoritesViewModel(badgeCount: String(badgeCount)))
    }
}
