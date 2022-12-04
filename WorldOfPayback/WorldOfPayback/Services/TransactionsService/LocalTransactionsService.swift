//
//  LocalTransactionsService.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import Foundation
import RxSwift

class LocalTransactionsService: JSONFileReaderService {
    // MARK: Init

    init() {
        super.init(fileName: "PBTransactions")
    }
}

// MARK: - TransactionsServiceProtocol

extension LocalTransactionsService: TransactionsServiceProtocol {
    func fetchTransactions() -> Observable<[Transaction]> {
        let responseModel: Observable<TransactionsResponseModel> = self.execute()
        return responseModel.map { $0.items }
            .delay(.seconds(3), scheduler: MainScheduler.instance)
    }
}
