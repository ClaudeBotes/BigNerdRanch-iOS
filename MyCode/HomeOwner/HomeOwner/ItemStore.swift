//
//  ItemStore.swift
//  HomeOwner
//
//  Created by Claude on 25/5/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    
    // @discardableResult annotation means that a 
    // caller of this function is free to ignore the 
    // result of calling this function
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        return newItem
    }
    
    init(){
        for _ in 0..<5 {
            createItem()
        }
    }
}
