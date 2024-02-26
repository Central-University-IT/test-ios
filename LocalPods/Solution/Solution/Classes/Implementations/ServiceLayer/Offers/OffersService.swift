//
//  OffersService.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 14.02.2024.
//

import Foundation
import ProdMobileCore

public struct OfferShortInfo {
    let id: String
    let image: String
    let supplier: Supplier
    let shortDescription: String
    let status: String
    let type: String
    let bonus: OfferBonus
    let restrictions: [OfferRestriction]
}

public struct OfferFullDetails {
    let id: String
    let image: String
    let supplier: Supplier
    let fullDescription: String
    let status: String
    let type: String
    let bonus: OfferBonus
    let restrictions: [OfferRestriction]
    let terms: [(type: String, value: String)]
    let promocode: String
}

struct Supplier {
    let name: String
    let baseColor: String
}

enum OfferRestriction {
    case forBundles(bundlesIds: [String], newValue: Double)
}

enum OfferBonus {
    case specialPoints(Double)
    case cashback(Double)
}

public protocol IOffersService {
    func offers(for userId: String, _ completion: @escaping ([OfferShortInfo]) -> ())
    func offersRecomendation(for userId: String, _ completion: @escaping ([OfferShortInfo]) -> ())
    func details(for offer: String, _ userId: String, _ completion: @escaping (OfferFullDetails?) -> ())
}

final class OffersService: IOffersService {
    private let networkingService: INetworkingService
    private let storage: IPersistenceStorage

    init(networkingService: INetworkingService, storage: IPersistenceStorage) {
        self.networkingService = networkingService
        self.storage = storage
    }

    func offers(for userId: String, _ completion: @escaping ([OfferShortInfo]) -> ()) {
        var queryParams: [String: String] =  [
            "recomendation": "false"
        ]

        // --TODO--
    }

    func offersRecomendation(for userId: String, _ completion: @escaping ([OfferShortInfo]) -> ()) {
        var queryParams: [String: String] =  [
            "recomendation": "true"
        ]

        // --TODO--
    }

    func details(for offer: String, _ userId: String, _ completion: @escaping (OfferFullDetails?) -> ()) {
        // --TODO--
    }
}
