//
//  ProductListView.swift
//  MarketplaceUIKit
//
//  Created by Bimo Sekti Wicaksono on 21/07/23.
//

import Foundation
import UIKit

class ProductListView: UIViewController ,PresenterToViewProductList {
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    var presenterDelegate: ViewToPresenterProductList?
    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        let nib = UINib(nibName: "ProductsCell", bundle: nil)
        productsCollectionView.register(nib, forCellWithReuseIdentifier: "productCell")
        presenterDelegate?.getProductList()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Product List", style: .plain, target: nil, action: nil)
    }
    
    func showProducts(products: [Product]) {
        self.products = products
        productsCollectionView.reloadData()
    }
}

extension ProductListView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductsCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(product: products?[indexPath.row] ?? nil)
        cell.layer.masksToBounds = false
        cell.layer.cornerRadius = 8.0
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.cornerRadius = 5.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        return CGSize(width: (screenSize.width/2) - 15, height: screenSize.width/1.45)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionAnimating?) {
        debugPrint("load more")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenterDelegate?.pushToProductDetail(productListView: self, products?[indexPath.row].id ?? 0)
    }
    
}
