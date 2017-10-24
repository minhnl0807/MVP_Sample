//
//  ProductListDataSource.swift
//  MVP_Sample
//
//  Created by Minh on 10/24/17.
//  Copyright © 2017 Minh. All rights reserved.
//

import Foundation
import UIKit

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
