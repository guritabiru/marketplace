//
//  Presenter.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 28/07/23.
//

import Foundation

class ProductDetailPresenter: ViewToPresenterProductDetail {
    var viewDelegate: PresenterToViewProductDetail?
    
    var interactorDelegate: PresenterToInteractorProductDetail?
    
    var routerDelegate: PresenterToRouterProductDetail?
    
    func getProductDetail(_ id: Int) {
        interactorDelegate?.getProductDetail(id)
    }
    
    
}

extension ProductDetailPresenter: InteractorToPresenterProductDetail {
    func fetchProductDetailSuccess(_ product: Product) {
        viewDelegate?.showProductDetail(product)
    }
    
    func tokenExpired() {
        debugPrint("Token expired, go to login page")
    }
    
    
}
