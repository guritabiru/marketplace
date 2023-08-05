//
//  ProductListInteractor.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 21/07/23.
//

import Foundation
import Alamofire

class ProductListInteractor: PresenterToInteractorProductList {
    var presenterDelegate: InteractorToPresenterProductList?
    
    func getProductList() {
        AF.request("https://fakestoreapi.com/products", method: .get).responseJSON{ response in
            guard let data = response.data else {return}
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                self.presenterDelegate?.fetchProductsSuccess(products)
            } catch {
                
            }
        }
    }
}
