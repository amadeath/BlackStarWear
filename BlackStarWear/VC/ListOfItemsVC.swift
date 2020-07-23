//
//  ListOfItemsVC.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/16/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import UIKit

class ListOfItemsVC: UIViewController{
    var items : [Item] = []
    var id = ""
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
    super.viewDidLoad()
    ItemsLoader().loadItems(id: self.id){ items in
    self.items = items
    self.collectionView.reloadData()
    }
  
    }
}
extension ListOfItemsVC :  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListOfItemsCollectionViewCell", for: indexPath) as! ListOfItemsCollectionViewCell
    let model = items[indexPath.row]
    cell.DescriptionLabel.text = model.name
    cell.PriceLabel.text = String(model.price.split(separator: ".")[0] + "₽")
    if let image = ImageLoader().loadImage(from: "https://blackstarshop.ru/\(model.image)" ){
    cell.imageView.image = image
    }
    cell.layer.borderWidth = 0.5
  
    return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    let w = (collectionView.bounds.width ) / 2.1
    return CGSize(width: w , height: w)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let Storyboard = UIStoryboard(name: "Main", bundle: nil)
    let DvC = Storyboard.instantiateViewController(identifier: "ItemVC") as! ItemVC
    self.navigationController?.pushViewController(DvC, animated: true)
    let model = items[indexPath.row]
    DvC.checkArr = model.images
    DvC.sizes = model.sizes
    DvC.color = model.color
    DvC.name = model.name
    DvC.mainText = model.mainText
    DvC.price = model.price
    }
    
    
    
}
