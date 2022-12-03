//
//  TransactionDetailProtocols.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import RxSwift

protocol TransactionDetailViewModelType {
    var input: TransactionDetailViewModelInput { get }
    var output: TransactionDetailViewModelOutput { get }
}

protocol TransactionDetailViewModelInput {
}

protocol TransactionDetailViewModelOutput {
    var partnerName: Observable<String> { get }
    var transactionDescription: Observable<String?> { get }
}

extension TransactionDetailViewModelType where Self: TransactionDetailViewModelInput & TransactionDetailViewModelOutput {
    var input: TransactionDetailViewModelInput { return self }
    var output: TransactionDetailViewModelOutput { return self }
}
