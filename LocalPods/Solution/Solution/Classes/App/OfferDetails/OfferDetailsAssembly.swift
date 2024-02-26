//
//  OfferDetailsAssembly.swift
//  Solution
//
//  Created by Genrikh Beraylik on 17.02.2024.
//

import UIKit
import ProdMobileCore

public protocol IOfferDetailsAssembly {
    func assemble(userId: String, offerId: String) -> UIViewController
}

final class OfferDetailsAssembly: IOfferDetailsAssembly {
    
    private let offersService: IOffersService
    private let favoritesManager: IFavoritesManager
    private let imageFactory: IImageFactory
    private let solution: SolutionProtocol.Type
    
    init(
        offersService: IOffersService,
        favoritesManager: IFavoritesManager,
        imageFactory: IImageFactory,
        solution: SolutionProtocol.Type
    ) {
        self.offersService = offersService
        self.favoritesManager = favoritesManager
        self.imageFactory = imageFactory
        self.solution = solution
    }
    
    func assemble(userId: String, offerId: String) -> UIViewController {
        let presenter = OfferDetailsPresenter(
            userId: userId,
            offerId: offerId,
            offersService: offersService,
            favoritesManager: favoritesManager,
            imageFactory: imageFactory)
        
        let view = OfferDetailsViewController(
            presenter: presenter,
            solution: solution
        )
        
        presenter.view = view
        
        return view
    }
    
}
