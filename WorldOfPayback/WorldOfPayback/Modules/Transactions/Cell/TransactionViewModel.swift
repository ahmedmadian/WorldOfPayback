//
//  TransactionViewModel.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import Foundation

class TransactionViewModel {
    let partnerName: String
    let description: String?
    let bookingDate: String
    let value: String

    init(transaction: Transaction) {
        self.partnerName = transaction.partnerDisplayName
        self.description = transaction.transactionDetail.description
        self.bookingDate = DateFormatter.getStringDate(for: transaction.transactionDetail.bookingDate)
        self.value = transaction.transactionDetail.value.description
    }
}
