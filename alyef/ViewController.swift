//
//  ViewController.swift
//  alyef
//
//  Created by iMac on 2019/03/04.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit
import SwiftyJSON

let imageCache = NSCache<AnyObject, AnyObject>()

class ViewController: UIViewController {
    
    var loader:Loader!
    var json:[JSON] = []
    
    let Obj = Glubal()
    let ObjApi = API()
    
    @IBOutlet weak var myTableView: UICollectionView!
    
    var iteams=Array<jsonData>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader = Loader.init(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(loader)
        
        getData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func getData(){
        
        loader.loaderStart()
        
        let url = "http://medhyafapp.com/ref/app/show/categories.php?x=y"
        self.ObjApi.getAll(endUrl: url, onCompletion: { (data) in
            
            self.loader.loaderStop()
            self.loader.removeFromSuperview()
            
            let json = data! as! [JSON]
            self.json = json
            self.myTableView.reloadData()
            
        }) { (error) in
            
            self.loader.loaderStop()
            self.loader.removeFromSuperview()
            
            self.getData()
            
        }
       
    }

}
 extension  ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return json.count
    
    }
  
//    func sendMessage(){
//    var url:String = "http://www.hisms.ws/api.php?"
//    + "send_sms"
//    + "&username=xxx966537811200"
//    + "&password=xxxas334as334"
//    + "&sender=" + "xxxihjeez"
//    + "&numbers=" + "phone"
//    + "&message=" + "URLEncoder.encode(s_msg)"
//    + "&date=" + "";
//    }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceListCell", for: indexPath as IndexPath) as! MCollectionViewCell
        
        let object = self.json[indexPath.row]
        
        if object != [] {
            if let imageFromCache = imageCache.object(forKey: "\(object["image"])" as AnyObject) as? UIImage {
                cell.Image?.image = imageFromCache
            }else {
                
                cell.Image?.image = UIImage(named: "\(object["image"])")
                imageCache.setObject(UIImage(named: "\(object["image"])")!, forKey: "\(object["image"])" as AnyObject)
            }
        
            cell.label.text = "\(object["name"])"
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        GlobalVariables.sharedManager.productId = "\(json[indexPath.row]["id"])"
        self.performSegue(withIdentifier: "toServise", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toServise" {
            if let viewController = segue.destination as? ReyfService {
                viewController.productId = GlobalVariables.sharedManager.productId
            
             }
        }
    }
}
   
  
    
    
    

