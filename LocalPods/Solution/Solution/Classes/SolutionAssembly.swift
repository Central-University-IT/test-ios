//
//  SolutionAssembly.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 20.02.2024.
//

import Foundation
import ProdMobileCore

public final class SolutionAssembly: SolutionProtocol {

    // MARK: - Рекламный баннер

    /// **Задание 1**
    /// Нужно реализовать сервис, который должен получить данные для отображения рекламного баннера
    public static func adBannerServise(networkService: INetworkingService) -> IAdBannerService {
        AdBannerService(networkService: networkService)
    }

    // MARK: - Виджет пользователя

    /// **Задание 2**
    /// Нужно реализовать сервис, который должен получить данные о юзере
    public static func userInfoService(
        networkingService: INetworkingService,
        storage: IPersistenceStorage
    ) -> IUserInfoService {
        UserInfoService(networkingService: networkingService, storage: storage)
    }
    /// **Задание 2**
    /// Нужно реализовать сервис, который должен получить историю операций конкретного пользователя
    public static func operationsService(
        networkingService: INetworkingService,
        storage: IPersistenceStorage
    ) -> IOperationsService {
        OperationsService(networkingService: networkingService, storage: storage)
    }

    /// **Задание 3**
    /// Нужно реализовать интерактор, который запрашивает все данные и готовит ViewModel для отображения виджета
    public static func userWidgetInteractor(
        userInfoService: IUserInfoService,
        operationsService: IOperationsService
    ) -> IUserWidgetInteractor {
        UserWidgetInteractor(
            userInfoService: userInfoService,
            operationsService: operationsService
        )
    }

    // MARK: - Список спецпредложений

    /// **Задание 4**
    /// Нужно реализовать сервис, который занимается получением необходимой информации по офферам/офферу
    public static func offersService(
        networkingService: INetworkingService,
        storage: IPersistenceStorage
    ) -> IOffersService {
        OffersService(networkingService: networkingService, storage: storage)
    }

    /// **Задание 4**
    /// Нужно реализовать сервис, который занимается получением списке всех подписок в системе с детальной информацией о них
    public static func bundlesService(
        networkingService: INetworkingService,
        storage: IPersistenceStorage
    ) -> IBundlesService {
        BundlesService(networkingService: networkingService, storage: storage)
    }

    /// **Задание 5**
    /// Нужно реализовать интерактор, который запрашивает все данные и готовит ViewModel для отображения списка спецпреложений
    /// Кроме того, данный интератор управляет взаимодействием пользователя с элементом списка
    public static func specialOffersListInteractor(
        offersService: IOffersService,
        offersManager: IOffersManager,
        bundlesService: IBundlesService,
        userInfoService: IUserInfoService,
        imageFactory: IImageFactory,
        favoritesManager: IFavoritesManager,
        offerDetailsAssembly: IOfferDetailsAssembly
    ) -> ISpecialOffersListInteractor {

        SpecialOffersListInteractor(
            offersService: offersService,
            offersManager: offersManager,
            bundlesService: bundlesService,
            userInfoService: userInfoService,
            favoritesManager: favoritesManager,
            imageFactory: imageFactory,
            offerDetailsAssembly: offerDetailsAssembly
        )
    }

    /// **Задание 5**
    /// Нужно реализовать менеджер, который фильтрует переданные ему офферы
    public static func offersManager() -> IOffersManager {
        OffersManager()
    }

    /// **Задание 6**
    /// Нужно реализовать менеджер, который управляет избранными офферами
    public static func favoritesManager(storage: IPersistenceStorage) -> IFavoritesManager {
        FavoritesManager(storage: storage)
    }

    /// **Задание 7**
    /// Нужно реализовать UI ячейки оффера
    public static func specialOfferView() -> ISpecialOfferView {
        SpecialOfferView()
    }

    // MARK: - Детали оффера

    /// **Задание 8**
    /// Нужно реализовать UI хэдера деталей оффера
    public static func offerHeaderView() -> IOfferHeaderView {
        OfferHeaderView()
    }

    /// **Задание 9**
    /// Нужно реализовать UI секции с промокодом
    public static func promocodeView() -> IPromocodeView {
        PromocodeView()
    }

    /// **Задание 10**
    /// Нужно реализовать UI кнопки лайка
    public static func favoriteLargeButton() -> IFavoriteLargeButton {
        FavoriteLargeButton()
    }
}
