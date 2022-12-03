//
//  TransactionsServiceProtocol.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import Foundation
import RxSwift

protocol TransactionsServiceProtocol: AnyObject {
    func fetchTransactions () -> Observable<[Transaction]>
}
