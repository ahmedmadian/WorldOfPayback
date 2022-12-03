//
//  TransactionDetailRoute.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import RxSwift

protocol TransactionDetailRouteProtocol: AnyObject {
}

class TransactionDetailRoute: BaseRoute, TransactionDetailRouteProtocol {
    // MARK: - Init

    init(transaction: Observable<TransactionViewModel>) {
        let viewController = TransactionDetailViewController()

        super.init(viewController: viewController)

        let viewModel = TransactionDetailViewModel(router: self, transaction: transaction)
        viewController.bind(to: viewModel)
    }
}
