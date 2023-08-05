//
//  ProductListProtocol.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 25/07/23.
//

import Foundation
import UIKit


protocol InteractorToPresenterProductList: InteractorToPresenterBase {
    func fetchProductsSuccess(_ products: [Product])
}

protocol PresenterToInteractorProductList: AnyObject {
    var presenterDelegate: InteractorToPresenterProductList? {get set}
    
    func getProductList()
}

protocol PresenterToViewProductList {
    var presenterDelegate: ViewToPresenterProductList? {get set}
    
    func showProducts(products: [Product])
}

protocol ViewToPresenterProductList {
    var viewDelegate: PresenterToViewProductList? {get set}
    var interactorDelegate: PresenterToInteractorProductList? {get set}
    var routerDelegate: PresenterToRouterProductList? {get set}
    
    func getProductList()
    func pushToProductDetail(productListView: UIViewController, _ id: Int)
}

protocol PresenterToRouterProductList {
    static func createModule() -> UIViewController
    
    func pushToProductDetail(productListView: UIViewController, _ id: Int)
}
