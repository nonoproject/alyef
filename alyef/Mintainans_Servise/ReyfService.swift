//
//  ReyfService.swift
//  alyef
//
//  Created by iMac on 2019/03/06.
//  Copyright © 2019 awad. All rights reserved.
//

import TransitionButton

import UIKit
import Foundation
import Alamofire
import CoreData
import MapKit

class ReyfService: UIViewController {
 
   
  
    var productId:String?
    var iteams=Array<iteamsJsonData>()
    var Searchiteams=Array<iteamsJsonData>()
    var Olditeams=Array<iteamsJsonData>()
    @IBOutlet weak var goBut: TransitionButton!
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var showPricing: UIButton!
    
    
    @IBOutlet weak var myScroll: UIScrollView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        print(productId!)
        getData()
        
    }
    
    func getData(){
        iteams.removeAll()
        // print("https://medhyafapp.com/medhyaf/app/show/products.php?x=y&category_id=\(productId!)&name=")
        Alamofire.request("https://medhyafapp.com/medhyaf/app/show/products.php?x=y&category_id=\(productId!)&name=")
            // Alamofire.request("https://medhyafapp.com/medhyaf/app/show/products.php?x=y&category_id=11&name=")
            .responseJSON { response in
//                print("JSON:\(response.result.value)")
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value as? [[String : Any]]{
                        for item in data {
                            // self.nameArray.append(naitem["item_id"] as! String)
                            self.iteams.append(iteamsJsonData(main_image: item["image"]as!String, offerImage: item["name"]as!String, titel: item["name"]as!String, price: item["price"]as!String, original_price: item["name"]as!String, offer_price: item["offer"]as!String,status: item["status"]as!String ,quantity: item["quantity"]as!String))
                          
                            
                        ///////////////////////////////////
                        /////////////////////////////// /////////////////////////////// ///////////////////////////////
                        self.myCollectionView.frame.size =   CGSize(width:UIScreen.main.bounds.size.width - 32, height:  (CGFloat(data.count * 65)))
                        
                        /////////////////////////////////////////////////////////////////////////////////////////////
                      let xs = (UIScreen.main.bounds.size.width - self.goBut.frame.width) / 2
                            self.goBut.frame =  CGRect(x: xs, y:  self.note.frame.maxY + 40, width: 150, height: 50)
                        let x = (UIScreen.main.bounds.size.width - self.note.frame.width) / 2
                            self.note.frame =  CGRect(x: x, y: self.myCollectionView.frame.maxY + 40, width: 343, height: 100)
                        self.showPricing.frame.origin.y = self.goBut.frame.maxY + 20
                            
//                        self.note.centerYAnchor.anchorWithOffset(to: self.view.centerYAnchor)
                            
                        
                        //////////////////////////////////////////////////////////////////////////////////////////////
//                             self.myCollectionView.reloadData()
                        
                            self.myScroll.layoutIfNeeded()
                        self.myScroll.isScrollEnabled = true
                        
                        var contentRect = CGRect.zero
                        for view in self.myScroll.subviews {
                            contentRect = contentRect.union(view.frame)
                        }
                        
                        self.myScroll.contentSize = contentRect.size
                        /////////////////////////////// /////////////////////////////// ///////////////////////////////
                        self.myCollectionView.reloadData()
                    }
                    
                 }
                    

                case .failure(_):

                    break

                }
            }
            .responseString { response in
                //print("String:\(response.result.value)")
                switch(response.result) {
                case .success(_):
                    if response.result.value != nil{
                        // print(data)
                    }

                case .failure(_):
                    //print("Error message:\(response.result.error)")
                    break
                }
        }

    }

    @IBAction func Contnue(_ sender: Any) {
//        if (UserDefaults.standard.value(forKey: "MapStoryboardID") != nil) {
        
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapStoryboardID")
            self.present(vc!, animated: true, completion: nil)
//        }
//        else {
        
//            print("noooooooooo")
        
//        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//    @IBAction func Advertise_but(_ sender: Any) {
//
//        self.performSegue(withIdentifier: "toServise", sender: nil)
//    }
}
extension ReyfService:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("awad say \(iteams.count)")
        return iteams.count
        
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceListCell", for: indexPath) as! ServiseCell
        cell.status?.text = "\(iteams[indexPath.row].titel!)"
       // cell.chang_status.setImage(UIImage(named: "checked"), for: .normal)
        cell.chang_status.tag = indexPath.row
           cell.chang_status.addTarget(self, action: #selector(butChecked), for: .touchUpInside)
      
        return cell
    }
    // MARK: - UICollectionViewDelegate protocol
    @objc func  butChecked(sender:UIButton){
        
        if sender.image(for: .normal) == nil {
            sender.setImage(UIImage(named: "check"), for: .normal)
        }else {
//            sender.imageView?.frame.size.width = 0
//            sender.imageView?.image = nil
            sender.setImage(nil, for: .normal)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
      
    }
    
}
