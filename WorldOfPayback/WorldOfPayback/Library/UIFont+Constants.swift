//
//  UIFont+Constants.swift
//  WorldOfPayback
//
//  Created by Ahmed Madian on 03.12.22.
//

import UIKit

extension UIFont {
    // MARK: - Properties

    static let label = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    static let priceLabel = UIFont.preferredFont(forTextStyle: .title3)

    // MARK: - Operations

    private func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(traits) else {
            return self
        }

        return UIFont(descriptor: descriptor, size: 0)
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}
