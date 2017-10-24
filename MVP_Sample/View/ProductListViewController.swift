//
//  ViewController.swift
//  MVP_Sample
//
//  Created by Minh on 10/23/17.
//  Copyright © 2017 Minh. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController, ProductListView {

    /*
         Declare a variable as Presenter (ProductListViewPresenter)
         Call func showProductList() in ProductListViewPresenter
     */
    var presenter: ProductListViewPresenter!
    
    // Data Source of tableView
    var productListDataSource: ProductListDataSource!
    
    // Outlet of tableView
    @IBOutlet weak var tableView: UITableView!
    
    // data
    let products = [
        Product(name: "Keyboard", price: 6),
        Product(name: "Mouse", price: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Init presenter before call func showProductList()
        presenter = ProductListPresenter(view: self, products: products)
        presenter.showProductList()
    }

    // func of protocol ProductListView
    func setProductList(products: [Product]) {
        productListDataSource = ProductListDataSource()
        productListDataSource.products = products
        tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        tableView.dataSource = productListDataSource
        tableView.reloadData()
    }
}

// MARK: display data to table view
class ProductListDataSource: NSObject, UITableViewDataSource {
    
    var products: [Product]!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = String(product.price)
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
