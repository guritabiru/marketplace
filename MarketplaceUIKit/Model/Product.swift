//
//  Product.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 21/07/23.
//

import Foundation

struct Product: Codable, Hashable {
    var id: Int? = 0
    var title: String? = ""
    var price: Double? = 0.0
    var description: String? = ""
    var category: String? = ""
    var image: String? = ""
    
    func dummyPriceBeforeDiscount() -> Double{
        return 1000000.0
    }
}
