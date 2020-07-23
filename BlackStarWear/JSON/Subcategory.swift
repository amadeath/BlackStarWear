//
//  Subcategory.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/12/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import Foundation
class Subcategory{
    let name : String
    let id : String
    init?(data: NSDictionary) {
    guard let name = data["name"]  as? String,
    let id = data["id"] as? String
    else {return nil}
    self.name = name
    self.id = id
    }
}

