//
//  ViewController.swift
//  MVP_Sample
//
//  Created by Minh on 10/23/17.
//  Copyright © 2017 Minh. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController, ProductListViewProtocol {
    var presenter: ProductListPresenter!
    var productListDataSource: ProductListDataSource!
    @IBOutlet weak var tableView: UITableView!
    
    let products = [
        Product(name: "Monitor", price: 20),
        Product(name: "Keyboard", price: 6),
        Product(name: "Mouse", price: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        presenter.showProductList()
    }

    func initialize() {
        presenter = ProductListPresenter(view: self, products: products)
        productListDataSource = ProductListDataSource()
    }
    
    func setProductList(products: [Product]) {
        productListDataSource.products = products
        tableView.dataSource = productListDataSource
        tableView.reloadData()
    }
}
