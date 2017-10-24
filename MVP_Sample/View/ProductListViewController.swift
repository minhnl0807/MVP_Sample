//
//  ViewController.swift
//  MVP_Sample
//
//  Created by Minh on 10/23/17.
//  Copyright © 2017 Minh. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController, ProductListView {
    var presenter: ProductListViewPresenter!
    var productListDataSource: ProductListDataSource!
    @IBOutlet weak var tableView: UITableView!
    
    let products = [
        Product(name: "Keyboard", price: 6),
        Product(name: "Mouse", price: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProductListPresenter(view: self, products: products)
        presenter.showProductList()
    }

    func setProductList(products: [Product]) {
        productListDataSource = ProductListDataSource()
        productListDataSource.products = products
        tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        tableView.dataSource = productListDataSource
        tableView.reloadData()
    }
}
