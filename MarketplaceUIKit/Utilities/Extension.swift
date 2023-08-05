//
//  Extension.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 31/07/23.
//

import Foundation
import UIKit

extension Double {
    
    func priceToRupiah() -> String {
        let dollarToRupiah = 14000.0 * self
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.init(identifier: "id_ID")
        return formatter.string(from: NSNumber(value: dollarToRupiah)) ?? "Rp 0"
    }
}

class TopAlignedLabel: UILabel {
    override func drawText(in rect: CGRect) {
        let textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        super.drawText(in: textRect)
    }
}
