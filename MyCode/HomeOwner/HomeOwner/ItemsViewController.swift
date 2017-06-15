//
//  ItemsViewController.swift
//  HomeOwner
//
//  Created by Claude on 25/5/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    // MARK: Variables
    var itemStore: ItemStore!
    
    // MARK Controller Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle table view that is pressed up against the statusbar
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    // MARK TableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create an instance of UITableViewCell, with default appearance
        // let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // Set the text on the cell with the description of the item that is at the nth index of the items,
        // where n = row this cell will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollers)"
        
        return cell
        
    }
    
}
