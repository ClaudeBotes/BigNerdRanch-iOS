//
//  ItemCell.swift
//  Homepwner
//
//  Created by Claude Botes on 22/06/2017.
//  Copyright © 2017 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialnumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    // Add this method in order for labels to respond after user has changed 
    // their text size preferences on their device and the app returns to active
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialnumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }

    
}
