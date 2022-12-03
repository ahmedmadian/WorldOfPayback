//
//  TransactionsViewController.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import UIKit
import RxSwift
import RxCocoa

class TransactionsViewController: BaseViewController, BindableType {
    // MARK: - Properties

    private let disposeBag: DisposeBag

    // MARK: - ViewModel

    var viewModel: TransactionsViewModelType!

    // MARK: - Views

    private lazy var transactionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.Payback.Background.PRIMARY
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TransactionTableViewCell.self,
                           forCellReuseIdentifier: TransactionTableViewCell.Constants.REUSE_IDENTIFIER)
        return tableView
    }()

    // MARK: - Init

    override init() {
        self.disposeBag = DisposeBag()

        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - BaseViewController

    override func setupViewLayout() {
        super.setupViewLayout()

        view.addSubview(transactionsTableView, translatesAutoresizingMaskIntoConstraints: false)

        NSLayoutConstraint.activate([
            transactionsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .paddingSmall),
            transactionsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: .paddingSmall),
            transactionsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.paddingSmall),
            transactionsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -.paddingSmall)
        ])
    }

    // MARK: - ViewModel Binding

    func bindViewModel() {
        rx.sentMessage(#selector(viewDidLoad))
            .map({ _ in}).bind(to: viewModel.input.viewDidLoad)
            .disposed(by: disposeBag)

        viewModel.output.title
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)

        viewModel.output.transactions
            .observe(on: MainScheduler.instance)
            .bind(to: transactionsTableView.rx.items(cellIdentifier: TransactionTableViewCell.Constants.REUSE_IDENTIFIER,
                                                     cellType: TransactionTableViewCell.self)) { item, viewModel, cell in
                cell.bind(to: viewModel)
            }.disposed(by: disposeBag)

        transactionsTableView.rx.modelSelected(TransactionViewModel.self)
            .bind(to: viewModel.input.modelSelected)
            .disposed(by: disposeBag)
    }
}
