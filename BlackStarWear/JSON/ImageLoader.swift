//
//  ImageLoader.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/17/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import Foundation
import UIKit
class ImageLoader{
    func loadImage(from string: String) -> UIImage? {
    guard let url = URL(string: string)
    else {
    print("Unable to create URL")
    return nil
    }
    var image: UIImage? = nil
    do {
    let data = try Data(contentsOf: url, options: [])
    image = UIImage(data: data)
    }
    catch {
    print(error.localizedDescription)
    }
    return image
    }
}
