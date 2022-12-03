//
//  TransactionValue.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 02.12.22.
//

import Foundation

struct TransactionValue: Codable {
    let amount: Int
    let currency: String
}

// MARK: - CustomStringConvertible

extension TransactionValue: CustomStringConvertible {
    var description: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency.lowercased()
        formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: amount)
        return formatter.string(from: number)!
    }
}
