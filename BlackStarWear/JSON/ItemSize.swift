//
//  File.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/22/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import Foundation
class ItemSize {
    let size : String
    init?(data: NSDictionary) {
    guard let size = data["size"]  as? String
    else {return nil}
    self.size = size
    }
}
