//
//  Item.swift
//  HomeOwner
//
//  Created by Claude on 25/5/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    var name: String
    var valueInDollers: Int
    var serialNumber: String?
    var dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInDollers: Int) {
        self.name = name
        self.valueInDollers = valueInDollers
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false){
        if random{
            let adjectives = ["Fluffy", "Rusty", "Shinny"]
            let nouns = ["Bears", "Spork", "Mac"]
            
            var randomIndex = arc4random_uniform(UInt32(adjectives.count)) // returns a random value between 0 and int passed in
            let randomAdjective = adjectives[Int(randomIndex)]
            
            randomIndex = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(randomIndex)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollers: randomValue)
        }else{
            self.init(name: "", serialNumber: nil, valueInDollers: 0)
        }
    }
}
