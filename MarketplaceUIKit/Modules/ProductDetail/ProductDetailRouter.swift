//
//  ProductDetailRouter.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 28/07/23.
//

import Foundation
import UIKit

class ProductDetailRouter: PresenterToRouterProductDetail {
    static func createModule(productId: Int) -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailView") as? ProductDetailView
        let presenter: ViewToPresenterProductDetail & InteractorToPresenterProductDetail = ProductDetailPresenter()
        let interactor: PresenterToInteractorProductDetail = ProductDetailInteractor()
        let router: PresenterToRouterProductDetail = ProductDetailRouter()
        
        view?.presenterDelegate = presenter
        view?.productId = productId
        presenter.viewDelegate = view
        presenter.interactorDelegate = interactor
        presenter.routerDelegate = router
        interactor.presenterDelegate = presenter
        
        
        return view!
    }
    
    
}
