//
//  SnapshotSolutionTest.swift
//  PROD-PlaygroundTests
//
//  Created by Kuznetsov Mikhail on 27.12.2023.
//

import UIKit
import FBSnapshotTestCase
@testable import Solution
import ProdMobileCore

class SnapshotSolutionTest: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()

        recordMode = false
    }
    
    func test_SpecialOfferView_whenIsNotFavorite() {
        let view = SpecialOfferView()
        let bundleBaseColor = #colorLiteral(red: 0.431372549, green: 0.3058823529, blue: 0.6941176471, alpha: 1)
        let bundleSecondaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let backgroundColor = #colorLiteral(red: 1, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
        
        let model = SpecialOfferViewModel(
            title: "Покупки в шестерочке",
            discountValue: "5%",
            description: "Совершайте покупки в магазинах шесторочки через сайт с промокодом ...",
            bundleName: "PREMIUM",
            bundleBaseColor: bundleBaseColor,
            bundleSecondaryColor: bundleSecondaryColor,
            image: ImageFactory().offerImage(id: "cart-img"),
            backgroundColor: backgroundColor,
            isFavorite: false,
            onTap: {},
            favouriteTap: {}
        )
        view.configure(viewModel: model)
        view.frame = .init(x: 0, y: 0, width: 360, height: 152)
        
        verify(view: view)
    }
    
    func test_OfferHeaderView() {
        let view = OfferHeaderView()
        let backgroundColor = #colorLiteral(red: 1, green: 0.7764705882, blue: 0.7764705882, alpha: 1)
        view.configure(
            value: "5%",
            text: "Покупки в шестерочке",
            image: ImageFactory().offerImage(id: "cart-img"),
            color: backgroundColor
        )
        view.frame = .init(x: 0, y: 0, width: 393, height: 207)
        verify(view: view)
    }
    
    func test_PromocodeView() {
        let view = PromocodeView()
        view.configure(code: "JASDKAJS42")
        view.frame = .init(x: 0, y: 0, width: 360, height: 41)
        verify(view: view)
    }
    
    func test_FavoriteLargeButton_whenIsNotFavorite() {
        let view = FavoriteLargeButton()
        view.configure(isFavorite: false, action: {})
        view.frame = .init(x: 0, y: 0, width: 360, height: 49)
        verify(view: view)
    }
}
