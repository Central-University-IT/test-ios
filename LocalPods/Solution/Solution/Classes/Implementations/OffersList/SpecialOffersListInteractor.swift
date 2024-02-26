//
//  SpecialOffersListInteractor.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 17.02.2024.
//

import UIKit
import ProdMobileCore

public protocol ISpecialOffersListInteractor {
    var router: IMainRouter? { get set }
    func prepareConfiguration(
        userId: String,
        with output: ISpecialOffersListInteractorOutput,
        completion: @escaping ([SpecialOfferViewModel]) -> Void
    )
}

public protocol ISpecialOffersListInteractorOutput: AnyObject {
    func update(offers: [SpecialOfferViewModel])
}

final class SpecialOffersListInteractor: ISpecialOffersListInteractor {


    private let offersService: IOffersService
    private let offersManager: IOffersManager
    private let bundlesService: IBundlesService
    private let userInfoService: IUserInfoService
    private let favoritesManager: IFavoritesManager
    private let imageFactory: IImageFactory
    private let offerDetailsAssembly: IOfferDetailsAssembly
    private weak var output: ISpecialOffersListInteractorOutput?

    private var userId: String?
    private var offers: [OfferShortInfo] = []
    private var userBundle: SpecialBundle?

    var router: IMainRouter?

    init(
        offersService: IOffersService,
        offersManager: IOffersManager,
        bundlesService: IBundlesService,
        userInfoService: IUserInfoService,
        favoritesManager: IFavoritesManager,
        imageFactory: IImageFactory,
        offerDetailsAssembly: IOfferDetailsAssembly
    ) {
        self.offersService = offersService
        self.offersManager = offersManager
        self.bundlesService = bundlesService
        self.userInfoService = userInfoService
        self.favoritesManager = favoritesManager
        self.imageFactory = imageFactory
        self.offerDetailsAssembly = offerDetailsAssembly
        favoritesManager.subscribe(self)
    }

    func prepareConfiguration(
        userId: String,
        with output: ISpecialOffersListInteractorOutput,
        completion: @escaping ([SpecialOfferViewModel]) -> Void
    ) {
        // --TODO--
    }
}

extension SpecialOffersListInteractor: IFavoritesDelegate {
    func favoritesDidChanged() {
        // --TODO--
    }
}
