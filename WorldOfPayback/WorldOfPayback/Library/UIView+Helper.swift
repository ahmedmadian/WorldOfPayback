//
//  UIView+Helper.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import UIKit

extension UIView {
    func addSubview(_ view: UIView, translatesAutoresizingMaskIntoConstraints: Bool) {
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        addSubview(view)
    }
}
