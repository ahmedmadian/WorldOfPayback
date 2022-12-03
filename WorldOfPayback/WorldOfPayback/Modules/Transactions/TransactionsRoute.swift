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

        let viewModel = TransactionsViewModel(router: self)
        viewController.bind(to: viewModel)
    }
}
