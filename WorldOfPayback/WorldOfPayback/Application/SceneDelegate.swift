//
//  SceneDelegate.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 02.12.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let initialViewController = RootNavigationViewController(route: TransactionsRoute())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }
}

