//
//  UIColor+Constants.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import UIKit

extension UIColor {
    enum Payback {
        enum Text {
            static let TEXT_PRIMARY: UIColor = UIColor(red: 22 / 255, green: 71 / 255, blue: 164 / 255, alpha: 1)
            static let TEXT_SECONDARY = UIColor.lightGray
            static let TITLE = UIColor.white
        }

        enum Background {
            static let PRIMARY: UIColor = UIColor(red: 22 / 255, green: 71 / 255, blue: 164 / 255, alpha: 1)
            static let SURFACE: UIColor = .white
        }
    }
}
