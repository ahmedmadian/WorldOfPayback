//
//  TransactionsRoute.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import Foundation
import RxSwift

enum TransactionsNavigationOptions {
    case detail(TransactionViewModel)
}

protocol TransactionsRouteProtocol: RouterProtocol {
    func navigate(to option: TransactionsNavigationOptions)
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

    // MARK: - TransactionsRouteProtocol
    func navigate(to option: TransactionsNavigationOptions) {
        switch option {
        case .detail(let transaction):
            let transactionDetailRoute = TransactionDetailRoute(transaction: Observable.just(transaction))
            self.navigationController?.push(transactionDetailRoute)
        }
    }
}
