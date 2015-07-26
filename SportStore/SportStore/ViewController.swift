//
//  ViewController.swift
//  SportStore
//
//  Created by Victor Ursan on 7/19/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import UIKit

class ProductTableCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stockStepper: UIStepper!
    @IBOutlet weak var stockField: UITextField!
    
    var product: Product?
}

var handler = {(product: Product) in println("Change: \(product.name) \(product.stockLevel) items in stock")}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var totalStockLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var productStore = ProductDataStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStockTotal()
        productStore.callback = {(product: Product) in
            self.tableView.visibleCells().map{(cell: AnyObject) -> () in
                if let productCell = cell as? ProductTableCell {
                    if productCell.product?.name == product.name {
                        productCell.stockStepper.value = Double(product.stockLevel)
                        productCell.stockField.text = String(product.stockLevel)
                    }
                }
            }
            self.displayStockTotal();
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func stockLevelDidChange(sender: AnyObject) {
        if var currentCell = sender as? UIView {
            while (true) {
                currentCell = currentCell.superview!
                if let cell = currentCell as? ProductTableCell {
                    if let product = cell.product {
                        if let stepper = sender as? UIStepper {
                            product.stockLevel = Int(stepper.value)
                        } else if let textfield = sender as? UITextField {
                            if let newValue = textfield.text.toInt() {
                                product.stockLevel = newValue
                            }
                        }
                        cell.stockStepper.value = Double(product.stockLevel)
                        cell.stockField.text = String(product.stockLevel)
                        productLogger.logItem(product)
                    }
                    break
                }
            }
            displayStockTotal()
        }
    }
    
    func displayStockTotal() {
        let finalTotals:(Int, Double) = productStore.products.reduce(( 0, 0.0)) {
            ( totals, product) -> (Int, Double) in
            return ( totals.0 + product.stockLevel, totals.1 + product.stockValue )
        }
        totalStockLabel.text = "\(finalTotals.0) Products in Stock" +
        " Total Value \(Utils.currencyStringFromNumber(finalTotals.1))"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productStore.products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let product = productStore.products[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell") as! ProductTableCell
        cell.product = product
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.productDescription
        cell.stockStepper.value = Double(product.stockLevel)
        cell.stockField.text = String(product.stockLevel)
        return cell;
    }
    
}