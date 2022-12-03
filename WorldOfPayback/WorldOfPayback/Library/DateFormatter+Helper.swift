//
//  DateFormatter+Helper.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import Foundation

extension DateFormatter {
    // MARK: - Properties

    static let fullExtended: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        return dateFormatter
    }()

    static let shortLocalizedDateAndTimeFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short

        return dateFormatter
    }()

    // MARK: - Operations

    static func getDate(for stringDate: String) -> Date? {
        return fullExtended.date(from: stringDate)
    }

    static func getStringDate(for date: Date) -> String {
        return shortLocalizedDateAndTimeFormatter.string(from: date)
    }
}
