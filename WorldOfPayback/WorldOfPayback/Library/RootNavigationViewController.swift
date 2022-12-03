//
//  RootNavigationViewController.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import UIKit

class RootNavigationViewController: UINavigationController {
    // MARK: - Init

    init(route: BaseRoute) {
        super.init(nibName: nil, bundle: nil)

        setRootRoute(route)
        setupAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Setup

    private func setupAppearance() {
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = UIColor.Payback.Background.PRIMARY
        barAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Payback.Background.SURFACE]
        navigationBar.standardAppearance = barAppearance
        navigationBar.scrollEdgeAppearance = barAppearance
    }
}
