//
//  ProductListPresenter.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 21/07/23.
//

import Foundation
import UIKit

class ProductListPresenter: ViewToPresenterProductList {
    var viewDelegate: PresenterToViewProductList?
    
    var interactorDelegate: PresenterToInteractorProductList?
    
    var routerDelegate: PresenterToRouterProductList?
    
    func getProductList() {
        interactorDelegate?.getProductList()
    }
    
    func pushToProductDetail(productListView: UIViewController, _ id: Int){
        routerDelegate?.pushToProductDetail(productListView: productListView, id)
    }
}

extension ProductListPresenter: InteractorToPresenterProductList {
    func fetchProductsSuccess(_ products: [Product]) {
        viewDelegate?.showProducts(products: products)
    }
    
    func tokenExpired() {
        
    }
}
