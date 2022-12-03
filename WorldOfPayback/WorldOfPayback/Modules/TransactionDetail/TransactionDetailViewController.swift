//
//  TransactionDetailViewController.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import UIKit
import RxSwift
import RxCocoa

class TransactionDetailViewController: BaseViewController, BindableType {
    // MARK: - Properties

    private let disposeBag: DisposeBag

    // MARK: - ViewModel

    var viewModel: TransactionDetailViewModelType!

    // MARK: - Views

    private lazy var containerScrollView = UIScrollView()

    private lazy var partnerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Payback.Text.TITLE
        label.font = .label.bold()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Payback.Text.TEXT_SECONDARY
        label.numberOfLines = .zero
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var containerStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [partnerNameLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = .paddingTiny
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
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

        view.addSubview(containerScrollView, translatesAutoresizingMaskIntoConstraints: false)
        
        containerScrollView.addSubview(containerStack, translatesAutoresizingMaskIntoConstraints: false)

        NSLayoutConstraint.activate([
            containerScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .padding),
            containerScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: .padding),
            containerScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.padding),
            containerScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -.padding),

            containerStack.leadingAnchor.constraint(equalTo: containerScrollView.leadingAnchor),
            containerStack.topAnchor.constraint(equalTo: containerScrollView.topAnchor),
            containerStack.trailingAnchor.constraint(equalTo: containerScrollView.trailingAnchor),
            containerStack.bottomAnchor.constraint(equalTo: containerScrollView.bottomAnchor),
        ])
    }

    // MARK: - ViewModel Binding

    func bindViewModel() {
        viewModel.output.partnerName
            .bind(to: partnerNameLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.output.transactionDescription
            .bind(to: descriptionLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
