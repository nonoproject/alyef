//
//  ServicePrice.swift
//  alyef
//
//  Created by iMac on 2019/03/06.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit
import SwiftyJSON
import MapKit
class ServicePrice: UIViewController {
//////////////////////////////
    
    var json = [JSON]()
    var count = 0
    var CategorieJson:[JSON] = []
    var ProductJson:[JSON] = []
    var bannerJson:[JSON]!
    var CategorieCount = 0
    ////////////////////////
    let ObjApi = API()
    let Obj = Glubal()
    
    var CategorieJso:[JSON] = []

    ////////////////////////
    @IBOutlet weak var agreeBut: UIButton!
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var myscroll: UIScrollView!
    @IBOutlet weak var seviceImage: UIImageView!
    var heit_of_collectio:Int = 120
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategoryData()
        // Do any additional setup after loading the view.
    }
    
    func loadCategoryData(){
        if CheckInternet.Connection() {
            let url = "\(connection().getUrl(word: "getPlaces"))?city="
            print(url)
            self.ObjApi.getAll(endUrl: url, onCompletion: { (json) in
                
                self.CategorieJson = (json! as? [JSON])!
                
                
                ////////////////////////////////////////
                ///////////////////////////////////
                /////////////////////////////// /////////////////////////////// ///////////////////////////////
                self.myTable.frame.size =   CGSize(width:UIScreen.main.bounds.size.width, height:  (CGFloat(self.CategorieJson.count * 70)))
                
                self.seviceImage.frame =  CGRect(x: 0, y: 70, width: UIScreen.main.bounds.size.width, height:150)
                self.agreeBut.frame =  CGRect(x: UIScreen.main.bounds.size.width/2, y:(CGFloat(self.CategorieJson.count * 1900)), width: UIScreen.main.bounds.size.width, height:50)
                /////////////////////////////////////////////////////////////////////////////////////////////
             
//                    self.dec.frame =  CGRect(x: 0, y: (CGFloat(self.CategorieJson.count * 70)), width: UIScreen.main.bounds.size.width, height:150)
                //////////////////////////////////////////////////////////////////////////////////////////////
                
                self.myscroll.layoutIfNeeded()
                self.myscroll.isScrollEnabled = true
                
                var contentRect = CGRect.zero
                for view in self.myscroll.subviews {
                    contentRect = contentRect.union(view.frame)
                }
                
                self.myscroll.contentSize = contentRect.size
                /////////////////////////////// /////////////////////////////// ///////////////////////////////
                self.myTable.isHidden = false
                
                //                print(json)
                self.myTable.reloadData()
            }, onError: { (err) in
                self.CategorieJson = []
                
                //            self.present(vc, animated: true, completion: nil)
            })
        }else{
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func AgreeAceion(_ sender: Any) {
    }
    @IBAction func back(_ sender: Any) {
    }
}

extension ServicePrice : UITableViewDelegate ,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.CategorieJson.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) ->
        UITableViewCell {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! tableViewCell
            let object = self.CategorieJson[indexPath.row]
            cell.mainImage.image = UIImage(named: "logo")
            
            if object != [] {
                
                cell.productName.text = "\(object["name"])"
                cell.ProductPrice.text = "\(object["price"]) ريال "
                cell.tag = indexPath.row
            }
            
            return cell
            /////////////
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return CGFloat(heit_of_collectio)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        print(self.CategorieJson[indexPath.row])
    }
    
}



