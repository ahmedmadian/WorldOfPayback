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
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
