//
//  OperationsService.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 14.02.2024.
//

import Foundation
import ProdMobileCore

public enum Operation {
    public enum Currency {
        case specialPoint
        case rub
    }

    case receipt(value: Double, currency: Currency)
    case withdrawal(value: Double, currency: Currency)
}

/// Обертка для кэширования 
struct OperationCache: Identifiable {
    let identifier: String
    let operation: Operation
}

public protocol IOperationsService {
    func currentAccount(for userId: String, _ completion: @escaping ([Operation]) -> ())
}

final class OperationsService: IOperationsService {

    private let networkingService: INetworkingService
    private let storage: IPersistenceStorage

    init(networkingService: INetworkingService, storage: IPersistenceStorage) {
        self.networkingService = networkingService
        self.storage = storage
    }

    func currentAccount(for userId: String, _ completion: @escaping ([Operation]) -> ()) {
        // --TODO--
    }
}
