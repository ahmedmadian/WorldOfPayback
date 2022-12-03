//
//  TransactionTableViewCell.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import UIKit

class TransactionTableViewCell: UITableViewCell, BindableType {
    // MARK: - Constants

    enum Constants {
        static let REUSE_IDENTIFIER = String(describing: Self.self)
        static let CONTAINER_VIEW_BORDER_WIDTH: CGFloat = 2
    }

    // MARK: - ViewModel

    var viewModel: TransactionViewModel!

    // MARK: - Views

    private(set) lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = Constants.CONTAINER_VIEW_BORDER_WIDTH
        view.backgroundColor = UIColor.Payback.Background.SURFACE
        view.layer.borderColor = UIColor.Payback.Background.SURFACE.cgColor
        view.layer.cornerRadius = .mediumCornerRadius
        return view
    }()

    private lazy var partnerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Payback.Text.TEXT_PRIMARY
        label.font = .label.bold()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.Payback.Text.text_secondary
        label.numberOfLines = .zero
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()

    private lazy var labelsStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [partnerNameLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = .paddingTiny
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .priceLabel.bold()
        label.textColor = UIColor.Payback.Text.TEXT_PRIMARY
        return label
    }()

    private lazy var bookingDateImageView: UIImageView = {
        let image = UIImage(named: "calendar")?.withTintColor(UIColor.Payback.Text.text_secondary)
        let imageView = UIImageView(image: image)
        return imageView
    }()

    private lazy var bookingDateLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = UIColor.Payback.Text.text_secondary
        return label
    }()

    private lazy var bookingDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bookingDateImageView, bookingDateLabel])
        stackView.axis = .horizontal
        stackView.spacing = .paddingTiny
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViewLayout()
        setupViewAppereance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Setup

    private func setupViewAppereance() {
        backgroundColor = UIColor.Payback.Background.PRIMARY
    }

    private func setupViewLayout() {
        contentView.addSubview(containerView, translatesAutoresizingMaskIntoConstraints: false)

        [labelsStack, valueLabel, bookingDateStackView].forEach {
            containerView.addSubview($0, translatesAutoresizingMaskIntoConstraints: false)
        }

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .paddingSmall),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .paddingSmall),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.paddingSmall),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.paddingSmall),

            labelsStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .paddingSmall),
            labelsStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .paddingSmall),

            valueLabel.leadingAnchor.constraint(equalTo: labelsStack.trailingAnchor, constant: .padding),
            valueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.paddingSmall),
            valueLabel.centerYAnchor.constraint(equalTo: labelsStack.centerYAnchor),
            valueLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3),

            bookingDateImageView.heightAnchor.constraint(equalTo: bookingDateLabel.heightAnchor),
            bookingDateImageView.widthAnchor.constraint(equalTo: bookingDateImageView.heightAnchor),

            bookingDateStackView.leadingAnchor.constraint(equalTo: labelsStack.leadingAnchor),
            bookingDateStackView.topAnchor.constraint(equalTo: labelsStack.bottomAnchor, constant: .padding),
            bookingDateStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.paddingSmall),
            bookingDateStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -.paddingSmall)
        ])
    }

    // MARK: - BindableType

    func bindViewModel() {
        partnerNameLabel.text = viewModel.partnerName
        descriptionLabel.text = viewModel.description
        valueLabel.text = viewModel.value
        bookingDateLabel.text = viewModel.bookingDate
    }
}
