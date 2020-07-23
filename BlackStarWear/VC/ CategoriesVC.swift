//
//  ViewController.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/12/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrayOfCategories : [Category] = []
    override func viewDidLoad() {
    super.viewDidLoad()
    CategoriesLoader().loadCategories{categories in
    self.arrayOfCategories = categories
    self.tableView.reloadData()
        }
    }
   
}

extension CategoriesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayOfCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell") as! CategoriesTableViewCell
    let model = arrayOfCategories[indexPath.row]
    cell.categoryNameLabel.text = model.name
    return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let model = arrayOfCategories[indexPath.row]
    let Storyboard = UIStoryboard(name: "Main", bundle: nil)
    let DvC = Storyboard.instantiateViewController(identifier: "SubcategoryVC") as! SubcategoryVC
    self.navigationController?.pushViewController(DvC, animated: true)
    DvC.checkArr = model.subcategory as! NSArray
      
       }
}
