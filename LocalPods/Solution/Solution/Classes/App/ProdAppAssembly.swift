//
//  ProdAppAssembly.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 20.02.2024.
//

import Foundation
import ProdMobileCore

extension String {
    static let currentUserId = "user312"
}

public final class ProdAppAssembly {

    // MARK: - AdBanner

    public static func adBannerView() -> IAdBannerView {
        AdBannerView()
    }

    public static func adBannerInteractor(adBannerServise: IAdBannerService, imageFactory: IImageFactory) -> IAdBannerInteractor {
        AdBannerInteractor(
            adBannerServise: adBannerServise,
            imageFactory: imageFactory
        )
    }

    // MARK: - Favorites

    public static func favoritesView() -> IFavoritesView {
        FavoritesView()
    }

    public static func favoritesInteractor(
        favoritesManager: IFavoritesManager
    ) -> IFavoritesInteractor {
        FavoritesInteractor(favoritesManager: favoritesManager)
    }

    // MARK: - UserInfo

    public static func userView() -> IUserView {
        UserView()
    }

    // MARK: - OfferDetails

    public static func offerDetailsAssembly(
        networkingService: INetworkingService,
        storage: IPersistenceStorage,
        imageFactory: IImageFactory,
        favoritesManager: IFavoritesManager,
        solution: SolutionProtocol.Type
    ) -> IOfferDetailsAssembly {
        let offersService = OffersService(networkingService: networkingService, storage: storage)
        return OfferDetailsAssembly(
            offersService: offersService,
            favoritesManager: favoritesManager,
            imageFactory: imageFactory,
            solution: solution
        )
    }
}
