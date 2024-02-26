//
//  AdBannerService.swift
//  Solution
//
//  Created by Lada Zudova on 15.02.2024.
//

import Foundation
import ProdMobileCore

public protocol IAdBannerService: AnyObject {
    func loadAdBannerInformation(userId: String, completion: @escaping (Result<BannerInfo, Error>) -> ())
}

final class AdBannerService: IAdBannerService {
    
    // Dependencies
    
    private let networkService: INetworkingService
    
    init(networkService: INetworkingService) {
        self.networkService = networkService
    }
    
    // MARK: - IAdBannerService
    
    func loadAdBannerInformation(userId: String, completion: @escaping (Result<BannerInfo, Error>) -> ()) {
        // --TODO--
    }
}
