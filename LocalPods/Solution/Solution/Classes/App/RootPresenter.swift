//
//  SolutionPresenter.swift
//  Solution
//
//  Created by Лада Зудова on 01.02.2024.
//

import Foundation
import UIKit
import ProdMobileCore

public protocol ISolutionPresenter: AnyObject {
    var specialOfferViewModels: [SpecialOfferViewModel] { get }
    func viewDidLoad()
}

public final class RootPresenter: ISolutionPresenter {
    
    private let adBannerInteractor: IAdBannerInteractor
    private let userWidgetInteractor: IUserWidgetInteractor
    private let favoritesInteractor: IFavoritesInteractor
    private let specialOffersListInteractor: ISpecialOffersListInteractor

    public weak var view: ISolutionViewController?
    
    public init(
        adBannerInteractor: IAdBannerInteractor,
        userWidgetInteractor: IUserWidgetInteractor,
        favoritesInteractor: IFavoritesInteractor,
        specialOffersListInteractor: ISpecialOffersListInteractor
    ) {
        self.adBannerInteractor = adBannerInteractor
        self.userWidgetInteractor = userWidgetInteractor
        self.favoritesInteractor = favoritesInteractor
        self.specialOffersListInteractor = specialOffersListInteractor
    }

    public var specialOfferViewModels: [SpecialOfferViewModel] = []
    
    public func viewDidLoad() {
        let userId = String.currentUserId

        let group = DispatchGroup()
        group.enter()
        adBannerInteractor.prepareConfiguration(userId: userId) { model in
            guard let model = model else { return }
            DispatchQueue.main.async { [weak self] in
                self?.view?.configureAdBanner(model: model)
                self?.view?.updateAdBannerHidden(false)
            }
            group.leave()
        }
        group.enter()
        userWidgetInteractor.prepareConfiguration(userId: userId) { model in
            guard let model = model else { return }
            DispatchQueue.main.async { [weak self] in
                self?.view?.configureUserView(model: model)
            }
            group.leave()
        }

        group.enter()
        favoritesInteractor.prepareConfiguration(with: self) { model in
            DispatchQueue.main.async { [weak self] in
                self?.view?.configureFavoritesView(model: model)
            }
            group.leave()
        }

        group.enter()
        specialOffersListInteractor.prepareConfiguration(userId: userId, with: self) { models in
            
            self.specialOfferViewModels = models
            group.leave()
        }

        group.notify(queue: .main) {
            self.view?.reloadTable()
        }
    }
}

extension RootPresenter: ISpecialOffersListInteractorOutput {
    public func update(offers: [SpecialOfferViewModel]) {
        self.specialOfferViewModels = offers
        self.view?.reloadTable()
    }
}

extension RootPresenter: IFavoritesInteractorOutput {
    public func update(favoritesViewModel: FavoritesViewModel) {
        view?.configureFavoritesView(model: favoritesViewModel)
    }
}
