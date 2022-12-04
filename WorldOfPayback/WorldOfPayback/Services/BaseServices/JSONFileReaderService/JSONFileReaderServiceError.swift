//
//  JSONFileReaderServiceError.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import Foundation

enum JSONFileReaderServiceError: LocalizedError {
    case fileNotFound
    case parsingError
    case noDataAvailable
    case failureTest

    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "File Not found"
        case .parsingError:
            return "JSON Parsing Failure"
        case .noDataAvailable:
            return "No data avaliable"
        case .failureTest:
            return "Failure test"
        }
    }
}
