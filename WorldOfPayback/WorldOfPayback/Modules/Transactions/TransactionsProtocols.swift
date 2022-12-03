//
//  TransactionsProtocols.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import RxSwift

protocol TransactionsViewModelType {
    var input: TransactionsViewModelInput { get }
    var output: TransactionsViewModelOutput { get }
}

protocol TransactionsViewModelInput {
    var viewDidLoad: PublishSubject<Void> { get }
}

protocol TransactionsViewModelOutput {
}

extension TransactionsViewModelType where Self: TransactionsViewModelInput & TransactionsViewModelOutput {
    var input: TransactionsViewModelInput { return self }
    var output: TransactionsViewModelOutput { return self }
}
