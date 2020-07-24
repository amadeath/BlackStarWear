//
//  PurchaseVC.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/23/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import UIKit
import RealmSwift
class PurchaseVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    lazy var checkArr: Results<ItemInBasket> = { Pers.shared.realm.objects(ItemInBasket.self) }()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if checkArr.count != 0 {
    return checkArr.count
    } else {return 0}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseTableViewCell") as! PurchaseTableViewCell
    let model = checkArr[indexPath.row]
    cell.nameLabel.text = model.name
    cell.sizeLabel.text = model.size
    cell.priceLabel.text = model.price
    cell.colorLabel.text = model.color
    cell.frame.size.height = view.frame.size.height / 6
    return cell
     }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete{
    Pers.shared.removeAll(index: indexPath.row)
    tableView.beginUpdates()
    tableView.deleteRows(at: [indexPath], with: .automatic)
    tableView.endUpdates()
          }
    }

}
