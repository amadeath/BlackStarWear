//
//  ItemVC.swift
//  BlackStarWear
//
//  Created by Karusel'ka . on 7/19/20.
//  Copyright © 2020 Karusel'ka . All rights reserved.
//

import UIKit

class ItemVC: UIViewController {
    var checkArr : NSArray = []
    var images : [ItemImage] = []
    var sizes : NSArray = []
    var sizeOfItem : [ItemSize] = []
    var curentIndex = 0
    var color = ""
    var name = ""
    var mainText = ""
    var price = ""
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    nameLabel.text = name
    colorLabel.text = "Цвет: \(color)"
    priceLabel.text = ("\(price.split(separator: ".")[0])"+"₽")
    mainTextLabel.text = String(mainText.split(separator: ".")[0])
    mainTextLabel.text = String(mainTextLabel.text!.split(separator: "!")[0])
    pageView.numberOfPages = images.count
        
    for (_, data) in checkArr.enumerated() where data is NSDictionary {
    if let image = ItemImage(data: data as! NSDictionary)
    {images.append(image)}}
    for (_, data) in sizes.enumerated() where data is NSDictionary {
    if let size = ItemSize(data: data as! NSDictionary)
    {sizeOfItem.append(size)}}

        
    }

    @IBAction func addItem(_ sender: Any) {
        picker.isHidden = !picker.isHidden
        
    }
    
}
extension ItemVC :  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
    let model = images[indexPath.row]
    if let image = ImageLoader().loadImage(from: "https://blackstarshop.ru/\(model.imageURL)" ){
    cell.imageView.image = image
    }
    return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    let w = collectionView.frame.size
    return CGSize(width: (w.width) - 1 , height: (w.height) - 1)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    curentIndex = Int(scrollView.contentOffset.x / collectionView.frame.size.width)
    pageView.currentPage = curentIndex
    }
}

extension ItemVC : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return sizeOfItem.count
    }
}
extension ItemVC : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    let model = sizeOfItem[row]
    let result = model.size
    return result
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let model = sizeOfItem[row]
    let Storyboard = UIStoryboard(name: "Main", bundle: nil)
    let DvC = Storyboard.instantiateViewController(identifier: "PurchaseVC") as! PurchaseVC
    self.navigationController?.pushViewController(DvC, animated: true)
    Pers.shared.addItem(name: name, price: price, size: model.size, color : color)
    }
}
