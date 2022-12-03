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
    var title: Observable<String>
    var transactions: Observable<[TransactionViewModel]>
    var modelSelected: PublishSubject<TransactionViewModel>
    private let router: TransactionsRouteProtocol

    // MARK: - Init

    init(router: TransactionsRouteProtocol, transactionsService: TransactionsServiceProtocol) {
        viewDidLoad = PublishSubject().asObserver()
        title = Observable.just("Transactions")
        transactions = PublishSubject()
        modelSelected = PublishSubject()
        self.router = router

        transactions = viewDidLoad.flatMapLatest { _ -> Observable<[Transaction]> in
            return transactionsService.fetchTransactions()
        }.map({ $0.map { TransactionViewModel(transaction: $0) }
                .sorted { $0.bookingDate > $1.bookingDate }
        })

        _ = modelSelected.subscribe(onNext: {
            router.navigate(to: .detail($0))
        })

    }
}
