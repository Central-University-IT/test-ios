//
//  UserWidgetInteractor.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 16.02.2024.
//

import Foundation

public protocol IUserWidgetInteractor: AnyObject {
    func prepareConfiguration(userId: String, completion: @escaping (UserViewModel?) -> Void)
}

final class UserWidgetInteractor: IUserWidgetInteractor {

    private let userInfoService: IUserInfoService
    private let operationsService: IOperationsService

    init(userInfoService: IUserInfoService, operationsService: IOperationsService) {
        self.userInfoService = userInfoService
        self.operationsService = operationsService
    }

    func prepareConfiguration(userId: String, completion: @escaping (UserViewModel?) -> Void) {
    }
}
