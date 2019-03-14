//
//  Advertise.swift
//  alyef
//
//  Created by iMac on 2019/03/06.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Advertise: UIViewController {

    @IBOutlet weak var advertise_message: UILabel!
    @IBOutlet weak var AdvertiseImage: UIImageView!
    
    var json:[JSON]!
    
    let Obj = Glubal()
    let ObjApi = API()
    
    var loader:Loader! // = Loader.init(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader = Loader.init(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(loader)
        
        getAdvertise()
    }
    
    func getAdvertise(){
        
        loader.loaderStart()
        
        DispatchQueue.main.async {
            
            let url = "http://medhyafapp.com/ref/app/show/ads.php"
            self.ObjApi.getAll(endUrl: url, onCompletion: { (json) in
                
                self.loader.loaderStop()
                self.loader.removeFromSuperview()
                
                let imagesJson = json! as? [JSON]
                
                for index in 0..<imagesJson!.count {
                    let url = "http://medhyafapp.com/ref/uploads/\(imagesJson![index]["image"])"
                    
                    self.advertise_message.text = "\(imagesJson![index]["message"])"
                    
                    self.ObjApi.dwonloadImage(endUrl: url, onCompletion: { (image) in
                        
                        self.AdvertiseImage.image = image!
                        
                    }, onError: { (err) in
                        print(err!)
                    })
                }
            }, onError: { (err) in
                self.loader.loaderStop()
                self.loader.removeFromSuperview()
                print(err!)
            })
        }
        
    }
    
    
    func getPhone(){
        Alamofire.request(connection().getUrl(word: "getPhone"))
            
            .responseJSON { response in
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value as? [[String : Any]]{
                        
                        for item in data {
                            GlobalVariables.sharedManager.phoneNumber = item["phone"] as! String
                        }
                    }
                    
                case .failure(_):
                    
                    break
                    
                }
            }
        
    }
    @IBAction func toMenuAction(_ sender: AnyObject) {
//        dismiss(animated: true, completion: nil)
        
        print("yes")
        
        self.performSegue(withIdentifier: "toMenu", sender: nil)
        
    }

}
