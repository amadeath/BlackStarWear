//
//  CategoriesLoader.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/12/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import Foundation
class CategoriesLoader{
    func loadCategories(completition: @escaping ([Category])-> Void){
    let url = URL(string: "https://blackstarshop.ru/index.php?route=api/v1/categories")!
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request){ data, response, error in
    if let data = data,
    let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
    let jsonDict = json as! NSDictionary
    var categories : [Category] = []
    for (_, data) in jsonDict where data is NSDictionary {
    if let category = Category(data: data as! NSDictionary)
    {categories.append(category)}
    }
    DispatchQueue.main.async {
    completition(categories)
    }
    }
    }
    task.resume()
                 }
}
