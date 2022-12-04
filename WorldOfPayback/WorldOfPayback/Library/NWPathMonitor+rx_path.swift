//
//  NWPathMonitor+rx_path.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 04.12.22.
//

import RxSwift
import Network

extension NWPathMonitor {
    var rx_path: Observable<NWPath> {
        Observable.create { [self] observer in
            self.pathUpdateHandler = { path in
                observer.onNext(path)
            }
            let queue = DispatchQueue(label: "NetworkMonitor")
            self.start(queue: queue)
            return Disposables.create {
                self.cancel()
            }
        }
    }
}
