//
//  ServicePrice.swift
//  alyef
//
//  Created by iMac on 2019/03/06.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit
import SwiftyJSON

class ServicePrice: UIViewController {
//////////////////////////////
    
    var json = [JSON]()
    ////////////////////////
    let ObjApi = API()
    let Obj = Glubal()
    
    var loader:Loader!
    
    let category_id = GlobalVariables.sharedManager.productId

    ////////////////////////
    @IBOutlet weak var agreeBut: UIButton!
    @IBOutlet weak var myscroll: UIScrollView!
    @IBOutlet weak var seviceImage: UIImageView!
    var heit_of_collectio:Int = 120
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader = Loader.init(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(loader)
        
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        loader.loaderStart()
        
        DispatchQueue.main.async {
            
            let url = "http://medhyafapp.com/ref/app/show/prices2.php?x=y&category_id=15" //\(self.category_id)"
            self.ObjApi.getAll(endUrl: url, onCompletion: { (json) in
                
                let imagesJson = json! as? [JSON]
                
                for index in 0..<imagesJson!.count {
                    let url = "http://medhyafapp.com/ref/uploads/\(imagesJson![index]["image"])"
                    
                    self.ObjApi.dwonloadImage(endUrl: url, onCompletion: { (image) in
                        
                        self.seviceImage.image = image!
                        
                        self.loader.loaderStop()
                        self.loader.removeFromSuperview()
                        
                        ///////////////////////////////////////////////////////////////////////////
                        let xs = (UIScreen.main.bounds.size.width - 150) / 2
                        self.agreeBut.frame =  CGRect(x: xs, y: self.seviceImage.frame.maxY + 20, width: 150, height: 50)
                        
                        self.myscroll.layoutIfNeeded()
                        self.myscroll.isScrollEnabled = true
                        
                        var contentRect = CGRect.zero
                        
                        for view in self.myscroll.subviews {
                            contentRect = contentRect.union(view.frame)
                        }
                        
                        self.myscroll.contentSize = contentRect.size
                        
                        /////////////////////////////////////////////////////////////////////////
                        
                    }, onError: { (err) in
                        print(err!)
                        self.loader.loaderStop()
                        self.loader.removeFromSuperview()
                    })
                }
            }, onError: { (err) in
                self.loader.loaderStop()
                self.loader.removeFromSuperview()
                print(err!)
            })
        }
    }
    
    
//
//    func loadData(){
//        if CheckInternet.Connection() {
//            let url = "\(connection().getUrl(word: "getPlaces"))?city="
//            print(url)
//            self.ObjApi.getAll(endUrl: url, onCompletion: { (json) in
//
//                self.CategorieJson = (json! as? [JSON])!
//
//
//                ////////////////////////////////////////
//                ///////////////////////////////////
//                /////////////////////////////// /////////////////////////////// ///////////////////////////////
//                self.myTable.frame.size =   CGSize(width:UIScreen.main.bounds.size.width, height:  (CGFloat(self.CategorieJson.count * 70)))
//
//                self.seviceImage.frame =  CGRect(x: 0, y: 70, width: UIScreen.main.bounds.size.width, height:150)
//                self.agreeBut.frame =  CGRect(x: UIScreen.main.bounds.size.width/2, y:(CGFloat(self.CategorieJson.count * 1900)), width: UIScreen.main.bounds.size.width, height:50)
//                /////////////////////////////////////////////////////////////////////////////////////////////
//
////                    self.dec.frame =  CGRect(x: 0, y: (CGFloat(self.CategorieJson.count * 70)), width: UIScreen.main.bounds.size.width, height:150)
//                //////////////////////////////////////////////////////////////////////////////////////////////
//
//                self.myscroll.layoutIfNeeded()
//                self.myscroll.isScrollEnabled = true
//
//                var contentRect = CGRect.zero
//                for view in self.myscroll.subviews {
//                    contentRect = contentRect.union(view.frame)
//                }
//
//                self.myscroll.contentSize = contentRect.size
//                /////////////////////////////// /////////////////////////////// ///////////////////////////////
//                self.myTable.isHidden = false
//
//                //                print(json)
//                self.myTable.reloadData()
//            }, onError: { (err) in
//                self.CategorieJson = []
//
//                //            self.present(vc, animated: true, completion: nil)
//            })
//        }else{
//        }
//
//    }
    

    @IBAction func AgreeAceion(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


