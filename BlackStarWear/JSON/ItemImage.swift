//
//  ItemImage.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/20/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import Foundation
import UIKit
class ItemImage {
    let imageURL : String
    let sortOrder : String
    init?(data: NSDictionary) {
    guard let imageURL = data["imageURL"]  as? String,
    let sortOrder = data["sortOrder"] as? String
    else {return nil}
    self.imageURL = imageURL
    self.sortOrder = sortOrder      }
}
