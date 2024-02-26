//
//  OfferDetailsViewModel.swift
//  Solution
//
//  Created by Genrikh Beraylik on 15.02.2024.
//

import UIKit

struct OfferDetailsViewModel {
    let offerTitle: String
    let brandColor: UIColor
    let cashbackValue: String
    let offerImage: UIImage
    let description: String
    let infoDetails: [(title: String, value: String)]
    let promocode: String?
}
