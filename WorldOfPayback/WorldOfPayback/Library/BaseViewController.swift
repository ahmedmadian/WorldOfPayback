//
//  BaseViewController.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import UIKit

class BaseViewController: UIViewController {
    // MARK: - Views

    private(set) lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.style = .large
        activity.color = UIColor.Payback.Background.SURFACE
        view.addSubview(activity, translatesAutoresizingMaskIntoConstraints: false)

        NSLayoutConstraint.activate([
            activity.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activity.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        return activity
    }()

    // MARK: - Init

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewAppereance()
        setupViewLayout()
    }

    // MARK: - View Setup

    func setupViewAppereance() {
        view.backgroundColor = UIColor.Payback.Background.PRIMARY
    }

    func setupViewLayout() {
    }

    // MARK: - Loader

    func showLoader() {
        view.bringSubviewToFront(activity)
        activity.isHidden = false
        activity.startAnimating()
    }

    func hideLoader() {
        activity.isHidden = true
        activity.stopAnimating()
    }
}
