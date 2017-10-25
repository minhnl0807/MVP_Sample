//
//  ProductListViewPresenter.swift
//  MVP_Sample
//
//  Created by Minh on 10/23/17.
//  Copyright © 2017 Minh. All rights reserved.
//

import Foundation

protocol ProductListViewPresenterProtocol {
    func showProductList()
}

class ProductListPresenter: ProductListViewPresenterProtocol {
    let view: ProductListViewProtocol
    let products: [Product]!
    
    required init(view: ProductListViewProtocol, products: [Product]) {
        self.view = view
        self.products = products
    }
    
    func showProductList() {
        self.view.setProductList(products: products)
    }
}
