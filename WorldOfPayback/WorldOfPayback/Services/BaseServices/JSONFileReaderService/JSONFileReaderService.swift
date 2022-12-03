//
//  JSONFileReaderService.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import Foundation
import RxSwift

class JSONFileReaderService {
    // MARK: - Properties

    private let fileName: String

    // MARK: - Init

    init(fileName: String) {
        self.fileName = fileName
    }

    // MARK: -

    func execute<Model: Codable> () -> Observable<Model> {
        return Observable<Model>.create { [weak self] observer in
            let disposable = Disposables.create()

            guard let path = Bundle.main.path(forResource: self?.fileName, ofType: "json") else {
                observer.onError(JSONFileReaderServiceError.fileNotFound)
                return disposable
            }

            guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                observer.onError(JSONFileReaderServiceError.noDataAvailable)
                return disposable
            }

            guard let object = try? JSONDecoder().decode(Model.self, from: data) else {
                observer.onError(JSONFileReaderServiceError.parsingError)
                return disposable
            }
           
            observer.onNext(object)
            observer.onCompleted()

            return disposable
        }
    }
}
