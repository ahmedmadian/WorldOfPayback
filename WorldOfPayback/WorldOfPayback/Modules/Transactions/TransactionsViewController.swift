//
//  TransactionsViewController.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import Foundation
import RxSwift
import RxCocoa

class TransactionsViewController: BaseViewController, BindableType {
    // MARK: - Properties

    private let disposeBag: DisposeBag

    // MARK: - ViewModel

    var viewModel: TransactionsViewModelType!

    // MARK: - Init

    override init() {
        self.disposeBag = DisposeBag()

        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewModel Binding

    func bindViewModel() {
        rx.sentMessage(#selector(viewDidLoad))
            .map({ _ in}).bind(to: viewModel.input.viewDidLoad)
            .disposed(by: disposeBag)
    }
}
