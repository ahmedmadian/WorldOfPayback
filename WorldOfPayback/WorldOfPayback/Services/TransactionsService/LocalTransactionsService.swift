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

        let randomFlag = Bool.random()

        if randomFlag {
            return responseModel.map { $0.items }
                .delay(.seconds(2), scheduler: MainScheduler.instance)
        } else {
            return Observable.create { observer in
                observer.onError(JSONFileReaderServiceError.failureTest)
                return Disposables.create()
            }
        }
    }
}
