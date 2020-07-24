//
//  Realm.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/24/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import Foundation
import RealmSwift
class ItemInBasket : Object{
    @objc dynamic var name = ""
    @objc dynamic var price = ""
    @objc dynamic var size = ""
    @objc dynamic var color = ""
}

class Pers{
    static let shared = Pers()
    let realm = try! Realm()
    var items : Results<ItemInBasket>!

    func addItem(name: String, price: String, size: String, color : String){
    let newItem = ItemInBasket()
    newItem.name = name
    newItem.color = color
    newItem.price = price
    newItem.size = size
    try! realm.write{
    realm.add(newItem)
        }
    }
    
    func removeAll(index: Int){
    let allItems = realm.objects(ItemInBasket.self)
    try! realm.write {
    realm.delete( allItems[index])
        }
    }
    
}
