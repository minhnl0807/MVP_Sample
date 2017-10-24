//
//  ProductListViewPresenter.swift
//  MVP_Sample
//
//  Created by Minh on 10/23/17.
//  Copyright © 2017 Minh. All rights reserved.
//

import Foundation

protocol ProductListViewPresenter {
    func showProductList()
}

/* Presenter conform ProductListViewPresenter so will have func showProductList()*/
class ProductListPresenter: ProductListViewPresenter {
    
    /*
         Declare a variable as View (ProductListView)
         Call func setProductList() in ProductListView
     */
    let view: ProductListView
    let products: [Product]!
    
    required init(view: ProductListView, products: [Product]) {
        self.view = view
        self.products = products
    }
    
    func showProductList() {
        self.view.setProductList(products: products)
    }
}
