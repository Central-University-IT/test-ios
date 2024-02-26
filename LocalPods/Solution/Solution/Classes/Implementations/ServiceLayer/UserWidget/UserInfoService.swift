//
//  UserInfoService.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 14.02.2024.
//

import Foundation
import ProdMobileCore

public struct UserInfo {
    public let id: String
    public let name: String
    public let surname: String
    public let bundleCode: String
}

extension UserInfo: Identifiable {
    public var identifier: String {
        id
    }
}

public protocol IUserInfoService {
    func userInfo(for userId: String, _ completion: @escaping (UserInfo?) -> ())
}

final class UserInfoService: IUserInfoService {

    private let networkingService: INetworkingService
    private let storage: IPersistenceStorage

    init(networkingService: INetworkingService, storage: IPersistenceStorage) {
        self.networkingService = networkingService
        self.storage = storage
    }

    func userInfo(for userId: String, _ completion: @escaping (UserInfo?) -> ()) {
        // --TODO--
    }
}
