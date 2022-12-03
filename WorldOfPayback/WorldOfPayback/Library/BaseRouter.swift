//
//  BaseRouter.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import UIKit

class BaseRoute {
    private(set) var viewController: UIViewController

    var navigationController: UINavigationController? {
        return viewController.navigationController
    }

    // MARK: - Init

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - UINavigationController + BaseRoute

extension UINavigationController {
    func push(_ route: BaseRoute, animated: Bool = true) {
        self.pushViewController(route.viewController, animated: animated)
    }

    func setRootRoute(_ route: BaseRoute, animated: Bool = true) {
        self.setViewControllers([route.viewController], animated: animated)
    }
}

// MARK: - RouterProtocol

protocol RouterProtocol: AnyObject {
    func showErrorAlert(with message: String?)
}

extension BaseRoute: RouterProtocol {
    func showErrorAlert(with message: String?) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController(title: "❌ Error", message: message, preferredStyle: .alert)
        alert.addAction(okAction)
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
