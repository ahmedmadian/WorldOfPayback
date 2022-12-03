//
//  TransactionsViewModel.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import RxSwift

class TransactionsViewModel: TransactionsViewModelType, TransactionsViewModelInput, TransactionsViewModelOutput {
    // MARK: - Properties

    var viewDidLoad: PublishSubject<Void>
    private let router: TransactionsRouteProtocol

    // MARK: - Init

    init(router: TransactionsRouteProtocol, transactionsService: TransactionsServiceProtocol) {
        viewDidLoad = PublishSubject().asObserver()
        self.router = router

        let transactions = viewDidLoad.flatMapLatest { _ -> Observable<[Transaction]> in
            return transactionsService.fetchTransactions()
        }
    }
}
