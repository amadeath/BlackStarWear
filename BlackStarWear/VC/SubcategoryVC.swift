//
//  SubcategoryVC.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/12/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import UIKit

class SubcategoryVC: UIViewController {
    var subcategories : [Subcategory] = []
    var checkArr : NSArray = []
    
    override func viewDidLoad() {
    super.viewDidLoad()
    for (_, data) in checkArr.enumerated() where data is NSDictionary {
    if let subcategory = Subcategory(data: data as! NSDictionary)
    {subcategories.append(subcategory)}
    }
    }
}
extension SubcategoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return subcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SubcategoriesTableViewCell") as! SubcategoriesTableViewCell
    let model = subcategories[indexPath.row]
    cell.nameLabel.text = "\(model.name)"
    return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let Storyboard = UIStoryboard(name: "Main", bundle: nil)
    let DvC = Storyboard.instantiateViewController(identifier: "ListOfItemsVC") as! ListOfItemsVC
    self.navigationController?.pushViewController(DvC, animated: true)
    let model = subcategories[indexPath.row]
    DvC.id = model.id
       }
}
