//
//  ProductDetailProtocol.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 28/07/23.
//

import Foundation
import UIKit

protocol ViewToPresenterProductDetail: AnyObject {
    var viewDelegate: PresenterToViewProductDetail? {get set}
    var interactorDelegate: PresenterToInteractorProductDetail? {get set}
    var routerDelegate: PresenterToRouterProductDetail? {get set}
    
    func getProductDetail(_ id: Int)
}

protocol InteractorToPresenterProductDetail: InteractorToPresenterBase {
    func fetchProductDetailSuccess(_ product: Product)
}

protocol PresenterToInteractorProductDetail: AnyObject {
    var presenterDelegate: InteractorToPresenterProductDetail? {get set}
    
    func getProductDetail(_ id: Int)
}

protocol PresenterToViewProductDetail: AnyObject {
    var presenterDelegate: ViewToPresenterProductDetail? {get set}
    var productId: Int {get set}
    
    func showProductDetail(_ product: Product)
}

protocol PresenterToRouterProductDetail: AnyObject {
    static func createModule(productId: Int) -> UIViewController
}
