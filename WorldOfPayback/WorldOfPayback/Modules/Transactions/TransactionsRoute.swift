//
//  TransactionsRoute.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import Foundation

protocol TransactionsRouteProtocol: AnyObject {
}

class TransactionsRoute: BaseRoute, TransactionsRouteProtocol {
    // MARK: - Init

    init() {
        let viewController = TransactionsViewController()

        super.init(viewController: viewController)

        let localTransactionsService = LocalTransactionsService()
        let viewModel = TransactionsViewModel(router: self, transactionsService: localTransactionsService)
        viewController.bind(to: viewModel)
    }
}
