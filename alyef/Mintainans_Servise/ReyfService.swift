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
import SwiftyJSON

var SelectedService:[JSON] = []

class ReyfService: UIViewController {
    
    var loader:Loader!
    var json:[JSON] = []
    
    let Obj = Glubal()
    let ObjApi = API()
 
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
        
        hideKeyboardWhenTappedAround()
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        loader = Loader.init(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(loader)
        
        getData()
        
    }
    
    func getData(){
        
        loader.loaderStart()
        
        let url = "https://medhyafapp.com/ref/app/show/products.php?x=y&category_id=\(productId!)&name="
        self.ObjApi.getAll(endUrl: url, onCompletion: { (data) in
            
            self.loader.loaderStop()
            self.loader.removeFromSuperview()
            
            let json = data! as! [JSON]
            self.json = json
            
            ///////////////////////////////////////////////////////////////////////////
            self.myCollectionView.frame.size =   CGSize(width:UIScreen.main.bounds.size.width - 32, height:  (CGFloat(self.json.count * 65)))

            ///////////////////////////////////////////////////////////////////////////
            let xs = (UIScreen.main.bounds.size.width - self.goBut.frame.width) / 2
                self.goBut.frame =  CGRect(x: xs, y:  self.note.frame.maxY + 40, width: 150, height: 50)
            let x = (UIScreen.main.bounds.size.width - 343) / 2
            self.note.frame =  CGRect(x: x, y: self.myCollectionView.frame.maxY + 40, width: 343, height: 100)
            self.showPricing.frame.origin.y = self.goBut.frame.maxY + 20

            ///////////////////////////////////////////////////////////////////////////

            self.myScroll.layoutIfNeeded()
            self.myScroll.isScrollEnabled = true

            var contentRect = CGRect.zero
            for view in self.myScroll.subviews {
                contentRect = contentRect.union(view.frame)
            }

            self.myScroll.contentSize = contentRect.size
            /////////////////////////////////////////////////////////////////////////
            self.myCollectionView.reloadData()
            
            
        }) { (error) in
            
            self.loader.loaderStop()
            self.loader.removeFromSuperview()
            
            self.getData()
            
        }
        
    }

    @IBAction func Contnue(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapStoryboardID") as! mapController
        
//        vc.u
        
        self.present(vc, animated: true, completion: nil)

    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension ReyfService:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return json.count
        
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceListCell", for: indexPath) as! ServiseCell
        
        let object = self.json[indexPath.row]
        if object != [] {
            cell.status?.text = "\(object["name"])"
            // cell.chang_status.setImage(UIImage(named: "checked"), for: .normal)
            cell.chang_status.tag = indexPath.row
            cell.chang_status.addTarget(self, action: #selector(butChecked), for: .touchUpInside)
        }
        
        
      
        return cell
    }
    
    @objc func  butChecked(sender:UIButton){
        
        if sender.image(for: .normal) == nil {
            sender.setImage(UIImage(named: "check"), for: .normal)
            SelectedService.append(self.json[sender.tag])
        }else {
            sender.setImage(nil, for: .normal)
            SelectedService.remove(at: sender.tag)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        let cell = collectionView.cellForItem(at: indexPath) as! ServiseCell
        
        if cell.chang_status.image(for: .normal) == nil {
            cell.chang_status.setImage(UIImage(named: "check"), for: .normal)
            SelectedService.append(self.json[indexPath.row])
        }else {
            cell.chang_status.setImage(nil, for: .normal)
            SelectedService.remove(at: indexPath.row)
        }
        
    }
    
}
