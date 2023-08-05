//
//  ProductDetailView.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 28/07/23.
//

import Foundation
import UIKit
import SDWebImage
import SkeletonView

class ProductDetailView: UIViewController, PresenterToViewProductDetail {
    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productCategoryLbl: UILabel!
    @IBOutlet weak var productDescriptionLbl: UITextView!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var productInfoView: UIView!
    
    var presenterDelegate: ViewToPresenterProductDetail?
    var productId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterDelegate?.getProductDetail(productId)
        self.navigationController?.navigationBar.tintColor = UIColor.systemPurple
        setupView(true)
    }
    
    func setupView(_ isShow: Bool) {
//        productNameLbl.isHidden = isShow
//        productCategoryLbl.isHidden = isShow
//        productInfoView.isHidden = isShow
//        productPriceLbl.isHidden = isShow
        if (!isShow) {
            productNameLbl.hideSkeleton()
            productCategoryLbl.hideSkeleton()
            productInfoView.hideSkeleton()
            productPriceLbl.hideSkeleton()
            productImg.hideSkeleton()
        }else{
            productNameLbl.showAnimatedGradientSkeleton()
            productCategoryLbl.showAnimatedGradientSkeleton()
            productInfoView.showAnimatedGradientSkeleton()
            productPriceLbl.showAnimatedGradientSkeleton()
            productImg.showAnimatedGradientSkeleton()
        }
        
        
    }
    
    func showProductDetail(_ product: Product) {
        setupView(false)
        productImg.sd_setImage(with: URL(string: product.image ?? ""))
        productNameLbl.text = product.title
        productCategoryLbl.text = product.category?.capitalized
        productDescriptionLbl.text = product.description
        productPriceLbl.text = product.price?.priceToRupiah()
    }
}
