//
//  RootAssembly.swift
//  PROD-Playground
//
//  Created by Kuznetsov Mikhail on 20.02.2024.
//

import UIKit
import ProdMobileCore
import Solution

final class RootAssembly {
    func assembleRoot() -> UIViewController {
        let imageFactory = ImageFactory()
        let networkService = NetworkingService()
        let persistenceStorage = PersistenceStorage()

        let favoritesManager = SolutionAssembly.favoritesManager(storage: persistenceStorage)

        let userInfoService = SolutionAssembly.userInfoService(
            networkingService: networkService,
            storage: persistenceStorage
        )

        var specialOffersListInteractor = SolutionAssembly.specialOffersListInteractor(
            offersService: SolutionAssembly.offersService(
                networkingService: networkService,
                storage: persistenceStorage
            ),
            offersManager: SolutionAssembly.offersManager(),
            bundlesService: SolutionAssembly.bundlesService(
                networkingService: networkService,
                storage: persistenceStorage
            ),
            userInfoService: userInfoService,
            imageFactory: imageFactory,
            favoritesManager: favoritesManager,
            offerDetailsAssembly: ProdAppAssembly.offerDetailsAssembly(
                networkingService: networkService,
                storage: persistenceStorage,
                imageFactory: imageFactory,
                favoritesManager: favoritesManager,
                solution: SolutionAssembly.self
            )
        )

        let presenter = RootPresenter(
            adBannerInteractor: ProdAppAssembly.adBannerInteractor(
                adBannerServise: SolutionAssembly.adBannerServise(
                    networkService: networkService
                ),
                imageFactory: imageFactory
            ),
            userWidgetInteractor: SolutionAssembly.userWidgetInteractor(
                userInfoService: userInfoService,
                operationsService: SolutionAssembly.operationsService(
                    networkingService: networkService,
                    storage: persistenceStorage
                )
            ),
            favoritesInteractor: ProdAppAssembly.favoritesInteractor(
                favoritesManager: favoritesManager
            ),
            specialOffersListInteractor: specialOffersListInteractor
        )
        let viewController = RootViewController(presenter: presenter)
        presenter.view = viewController

        specialOffersListInteractor.router = viewController
        return viewController
    }
}
