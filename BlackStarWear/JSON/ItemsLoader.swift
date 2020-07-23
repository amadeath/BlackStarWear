//
//  ItemsLoader.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/16/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import Foundation
class ItemsLoader{
    func loadItems(id: String, completition: @escaping ([Item])-> Void){
    let url = URL(string: "https://blackstarshop.ru/index.php?route=api/v1/products&cat_id="+id)!
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request){ data, response, error in
    if let data = data,
    let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
    let jsonDict = json as! NSDictionary
    var items : [Item] = []
    for (_, data) in jsonDict where data is NSDictionary {
    if let item = Item(data: data as! NSDictionary)
    {items.append(item)}
    }
    DispatchQueue.main.async {
    completition(items)
    }
    }
    }
    task.resume()
    }
}
