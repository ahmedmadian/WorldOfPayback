//
//  TransactionsViewModel.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import Foundation

class TransactionsViewModel: TransactionsViewModelType, TransactionsViewModelInput, TransactionsViewModelOutput {
    // MARK: - Properties

    private let router: TransactionsRouteProtocol

    // MARK: - Init

    init(router: TransactionsRouteProtocol) {
        self.router = router
    }
}
