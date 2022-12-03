//
//  TransactionDetailViewModel.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import RxSwift

class TransactionDetailViewModel: TransactionDetailViewModelType, TransactionDetailViewModelInput, TransactionDetailViewModelOutput {
    // MARK: - Properties

    var partnerName: Observable<String>
    var transactionDescription: Observable<String?>

    // MARK: - Init

    init(router: TransactionDetailRouteProtocol, transaction: Observable<TransactionViewModel>) {
        partnerName = transaction.map({ $0.partnerName })
        transactionDescription = transaction.map({ $0.description })
    }
}
