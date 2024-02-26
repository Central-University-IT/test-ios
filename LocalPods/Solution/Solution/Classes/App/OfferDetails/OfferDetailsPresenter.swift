//
//  OfferDetailsPresenter.swift
//  Solution
//
//  Created by Genrikh Beraylik on 17.02.2024.
//

import UIKit
import ProdMobileCore

protocol IOfferDetailsPresenter {
    func viewDidLoad()
    func didTapFavoriteButton()
}

final class OfferDetailsPresenter: IOfferDetailsPresenter {
    
    weak var view: IOfferDetailsView?
    private let userId: String
    private let offerId: String
    private let offersService: IOffersService
    private let favoritesManager: IFavoritesManager
    private let imageFactory: IImageFactory
    
    init(userId: String,
         offerId: String,
         offersService: IOffersService,
         favoritesManager: IFavoritesManager,
         imageFactory: IImageFactory) {
        self.userId = userId
        self.offerId = offerId
        self.offersService = offersService
        self.favoritesManager = favoritesManager
        self.imageFactory = imageFactory
    }
    
    func viewDidLoad() {
        loadOfferDetails()
        
        favoritesManager.subscribe(self)
    }
    
    func didTapFavoriteButton() {
        if isOfferFavorite() {
            favoritesManager.unlikeOffer(with: offerId)
        } else {
            favoritesManager.likeOffer(with: offerId)
        }
    }
    
    // private
    
    private func loadOfferDetails() {
        offersService.details(for: offerId, userId) { [weak self] details in
            DispatchQueue.main.async {
                guard let self, let details = details else {
                    self?.view?.displayError("Не удалось загрузить Спецпредложение. Попробуйте снова!")
                    return
                }
                
                let viewModel = self.makeViewModel(from: details)
                self.view?.configure(viewModel: viewModel)
                self.view?.configure(isFavorite: self.isOfferFavorite())
            }
        }
    }
    
    private func makeViewModel(from details: OfferFullDetails) -> OfferDetailsViewModel {
        let viewModel = OfferDetailsViewModel(
            offerTitle: details.supplier.name,
            brandColor: UIColor(hexString: details.supplier.baseColor) ?? UIColor(),
            cashbackValue: bonusTypeValue(details.bonus),
            offerImage: imageFactory.offerImage(id: details.image),
            description: details.fullDescription,
            infoDetails: details.terms.map { ($0, $1) },
            promocode: details.promocode)
        
        return viewModel
    }
    
    private func isOfferFavorite() -> Bool {
        favoritesManager.favorites.contains(where: { $0 == offerId })
    }
    
    private func bonusTypeValue(_ bonus: OfferBonus) -> String {
        switch bonus {
        case .specialPoints(let double):
            return "\(double) бал."
        case .cashback(let double):
            return "\(double) %"
        }
    }
}

// MARK: - IFavoritesDelegate

extension OfferDetailsPresenter: IFavoritesDelegate {
    func favoritesDidChanged() {
        view?.configure(isFavorite: isOfferFavorite())
    }
}
