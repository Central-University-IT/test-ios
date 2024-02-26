//
//  BundlesService.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 14.02.2024.
//

import Foundation
import ProdMobileCore

public struct SpecialBundle: Identifiable {
    public let code: String
    public let name: String
    public let base_color: String
    public let secondary_color: String

    public var identifier: String { code }
}

public protocol IBundlesService {
    func bundles(_ completion: @escaping ([SpecialBundle]) -> ())
}

final class BundlesService: IBundlesService {
    
    private let networkingService: INetworkingService
    private let storage: IPersistenceStorage

    init(networkingService: INetworkingService, storage: IPersistenceStorage) {
        self.networkingService = networkingService
        self.storage = storage
    }

    func bundles(_ completion: @escaping ([SpecialBundle]) -> ()) {
        // --TODO--
    }
}
