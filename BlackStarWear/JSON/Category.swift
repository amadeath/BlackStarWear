//
//  Category.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/12/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import Foundation
struct Category {
    let name : String
    let subcategory : Any
    init?(data: NSDictionary) {
    guard let name = data["name"] as? String,
    let subcategory = data["subcategories"] as? NSArray
    else {return nil}
    self.name = name
    self.subcategory = subcategory
    }
}
