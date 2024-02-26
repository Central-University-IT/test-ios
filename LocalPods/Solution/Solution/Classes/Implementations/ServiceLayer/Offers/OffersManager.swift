//
//  OffersManager.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 14.02.2024.
//

import Foundation

public protocol IOffersManager {
    func filter(
        offers: [OfferShortInfo],
        for bundle: SpecialBundle?
    ) -> [OfferShortInfo]
}

final class OffersManager: IOffersManager {

    func filter(
        offers: [OfferShortInfo],
        for bundle: SpecialBundle?
    ) -> [OfferShortInfo] {
        // --TODO--
        []
    }
}
