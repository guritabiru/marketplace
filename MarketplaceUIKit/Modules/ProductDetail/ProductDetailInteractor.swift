//
//  ProductDetailInteractor.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 28/07/23.
//

import Foundation
import Alamofire

class ProductDetailInteractor: PresenterToInteractorProductDetail {
    var presenterDelegate: InteractorToPresenterProductDetail?
    
    func getProductDetail(_ id: Int) {
        AF.request("https://fakestoreapi.com/products/\(id)", method: .get).responseJSON{response in
            guard let data = response.data else {return}
            do {
                let productDetail = try JSONDecoder().decode(Product.self, from: data)
                self.presenterDelegate?.fetchProductDetailSuccess(productDetail)
            } catch {
                
            }
        }
    }
    
    
}
