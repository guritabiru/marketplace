//
//  ProductsCell.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 25/07/23.
//

import UIKit
import SDWebImage

class ProductsCell: UICollectionViewCell {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(product: Product?) {
        productImg.sd_setImage(with: URL(string: product?.image ?? ""))
        productNameLbl.text = product?.title ?? ""
        productPriceLbl.text = product?.price?.priceToRupiah()
    }

}
