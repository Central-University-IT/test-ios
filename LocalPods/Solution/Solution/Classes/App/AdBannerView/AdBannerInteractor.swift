//
//  AdBannerInteractor.swift
//  Solution
//
//  Created by Lada Zudova on 14.02.2024.
//

import UIKit
import ProdMobileCore

public protocol IAdBannerInteractor: AnyObject {
    func prepareConfiguration(userId: String, completion: @escaping (AdBannerViewModel?) -> Void)
}

final class AdBannerInteractor: IAdBannerInteractor {
    
    // dependencies

    private let adBannerServise: IAdBannerService
    private let imageFactory: IImageFactory
    
    init(
        adBannerServise: IAdBannerService,
        imageFactory: IImageFactory
    ) {
        self.adBannerServise = adBannerServise
        self.imageFactory = imageFactory
    }
    
    // MARK: - IAdBannerViewPresenter
    
    func prepareConfiguration(userId: String, completion: @escaping (AdBannerViewModel?) -> Void) {
        adBannerServise.loadAdBannerInformation(userId: userId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                let image = self.imageFactory.bannerImage(id: model.imageId)
                let viewModel = AdBannerViewModel(
                    title: model.title,
                    subtitle: model.description,
                    image: image,
                    backgroundColor: UIColor(hexString: model.backgroundColor) ?? UIColor()
                )
                completion(viewModel)
            case .failure:
                completion(nil)
            }
        }
    }
}
