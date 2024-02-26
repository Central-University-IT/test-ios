//
//  SolutionProtocol.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 21.02.2024.
//

import Foundation
import ProdMobileCore

public protocol SolutionProtocol {
    // MARK: - Рекламный баннер

    /// **Задание 1**
    /// Нужно реализовать сервис, который должен получить данные для отображения рекламного баннера
    static func adBannerServise(networkService: INetworkingService) -> IAdBannerService

    // MARK: - Виджет пользователя

    /// **Задание 2**
    /// Нужно реализовать сервис, который должен получить данные о юзере
    static func userInfoService(
        networkingService: INetworkingService,
        storage: IPersistenceStorage
    ) -> IUserInfoService
    /// **Задание 2**
    /// Нужно реализовать сервис, который должен получить историю операций конкретного пользователя
    static func operationsService(
        networkingService: INetworkingService,
        storage: IPersistenceStorage
    ) -> IOperationsService

    /// **Задание 3**
    /// Нужно реализовать интерактор, который запрашивает все данные и готовит ViewModel для отображения виджета
    static func userWidgetInteractor(
        userInfoService: IUserInfoService,
        operationsService: IOperationsService
    ) -> IUserWidgetInteractor

    // MARK: - Список спецпредложений

    /// **Задание 4**
    /// Нужно реализовать сервис, который занимается получением необходимой информации по офферам/офферу
    static func offersService(
        networkingService: INetworkingService,
        storage: IPersistenceStorage
    ) -> IOffersService

    /// **Задание 4**
    /// Нужно реализовать сервис, который занимается получением списке всех подписок в системе с детальной информацией о них
    static func bundlesService(
        networkingService: INetworkingService,
        storage: IPersistenceStorage
    ) -> IBundlesService

    /// **Задание 5**
    /// Нужно реализовать интерактор, который запрашивает все данные и готовит ViewModel для отображения списка спецпреложений
    /// Кроме того, данный интератор управляет взаимодействием пользователя с элементом списка
    static func specialOffersListInteractor(
        offersService: IOffersService,
        offersManager: IOffersManager,
        bundlesService: IBundlesService,
        userInfoService: IUserInfoService,
        imageFactory: IImageFactory,
        favoritesManager: IFavoritesManager,
        offerDetailsAssembly: IOfferDetailsAssembly
    ) -> ISpecialOffersListInteractor

    /// **Задание 5**
    /// Нужно реализовать менеджер, который фильтрует переданные ему офферы
    static func offersManager() -> IOffersManager

    /// **Задание 6**
    /// Нужно реализовать менеджер, который управляет избранными офферами
    static func favoritesManager(storage: IPersistenceStorage) -> IFavoritesManager

    /// **Задание 7**
    /// Нужно реализовать UI ячейки оффера
    static func specialOfferView() -> ISpecialOfferView

    // MARK: - Детали оффера

    /// **Задание 8**
    /// Нужно реализовать UI хэдера деталей оффера
    static func offerHeaderView() -> IOfferHeaderView

    /// **Задание 9**
    /// Нужно реализовать UI секции с промокодом
    static func promocodeView() -> IPromocodeView
    /// **Задание 10**
    /// Нужно реализовать UI кнопки лайка
    static func favoriteLargeButton() -> IFavoriteLargeButton
}
