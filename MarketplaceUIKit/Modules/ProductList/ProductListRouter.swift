//
//  ProductListRouter.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 21/07/23.
//

import Foundation
import UIKit

class ProductListRouter: PresenterToRouterProductList {
    func pushToProductDetail(productListView: UIViewController, _ id: Int) {
        let productDetailModule = ProductDetailRouter.createModule(productId: id)
        productListView.navigationController?.pushViewController(productDetailModule, animated: true)
    }
    
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductListView") as? ProductListView
        var presenter: ViewToPresenterProductList & InteractorToPresenterProductList = ProductListPresenter()
        let interactor: PresenterToInteractorProductList = ProductListInteractor()
        let router: PresenterToRouterProductList = ProductListRouter()
        
        view?.presenterDelegate = presenter
        presenter.interactorDelegate = interactor
        presenter.viewDelegate = view
        presenter.routerDelegate = router
        interactor.presenterDelegate = presenter
        
        
        return view!
    }
    
    
}
