//
//  Item.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/17/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import Foundation
class Item {
    let name : String
    let image : String
    let price : String
    let color : String
    let mainText : String
    let images : NSArray
    let sizes : NSArray
    init?(data: NSDictionary) {
    guard let name = data["name"] as? String,
    let image = data["mainImage"] as? String,
    let mainText = data["description"] as? String,
    let price = data["price"] as? String,
    let color = data["colorName"] as? String,
    let images = data["productImages"] as? NSArray,
    let sizes = data["offers"] as? NSArray
    else {return nil}
    self.name = name
    self.image = image
    self.mainText = mainText
    self.price = price
    self.images = images
    self.color = color
    self.sizes = sizes
    }
}
