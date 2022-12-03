//
//  TransactionDetail.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 02.12.22.
//

import Foundation

struct TransactionDetail: Codable {
    let description: String?
    private let bookingDateString: String
    let value: TransactionValue
    var bookingDate: Date {
        guard let date = DateFormatter.getDate(for: bookingDateString) else {
            fatalError("Can't convert date")
        }

        return date
    }

    // MARK: - CodingKeys

    enum CodingKeys: String, CodingKey {
        case description, value
        case bookingDateString = "bookingDate"
    }
}
