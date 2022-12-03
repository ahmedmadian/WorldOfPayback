//
//  TransactionDetail.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 02.12.22.
//

import Foundation

struct TransactionDetail: Codable {
    let description: String?
    let bookingDate: String
    let value: TransactionValue
}
