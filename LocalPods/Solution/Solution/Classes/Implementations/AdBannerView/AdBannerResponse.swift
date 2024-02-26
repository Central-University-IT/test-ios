//
//  AdBannerResponse.swift
//  Solution
//
//  Created by Lada Zudova on 14.02.2024.
//

import Foundation

public struct AdBannerResponse {
    public let id: String
    public let bannerInfo: BannerInfo

    public init(id: String, bannerInfo: BannerInfo) {
        self.id = id
        self.bannerInfo = bannerInfo
    }
}

public struct BannerInfo {
    public let title: String
    public let description: String
    public let imageId: String
    public let backgroundColor: String

    public init(title: String, description: String, imageId: String, backgroundColor: String) {
        self.title = title
        self.description = description
        self.imageId = imageId
        self.backgroundColor = backgroundColor
    }
}
