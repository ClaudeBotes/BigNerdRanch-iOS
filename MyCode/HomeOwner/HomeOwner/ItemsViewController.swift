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
    
    // MARK TableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    
    
}
