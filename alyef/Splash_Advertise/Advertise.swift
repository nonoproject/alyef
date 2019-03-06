//
//  Advertise.swift
//  alyef
//
//  Created by iMac on 2019/03/06.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit

import Alamofire
class Advertise: UIViewController {

    @IBOutlet weak var advertise_message: UILabel!
    @IBOutlet weak var AdvertiseImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
getAdvertise()
        // Do any additional setup after loading the view.
    }
    func getAdvertise(){
     
        Alamofire.request("http://medhyafapp.com/ref/app/show/ads.php")
            
            .responseJSON { response in
                 print("JSON:\(response.result.value)")
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value as? [[String : Any]]{
                        for item in data {
                            //self.iteams.append(ImageData(image: item["image_url"]as!String,nameLable:item["tag"] as! String,dateLable: item["1"] as! String,butId:item["id"] as!String))
                            //  print("JSON:\()")
                            self.advertise_message.text = item["message"] as! String
                            if item["image"] != nil {
                                var image_url:String=item["image"] as! String
                                // connection().getUrl(word: "getAddvertiseImageLink")+item["image"] as String
                                if let imageURI = URL(string: ("http://medhyafapp.com/ref/uploads/" + image_url)) {
                                    //print("It's a photo!")
                                    DispatchQueue.global(qos: .background).async {
                                        let data = try? Data(contentsOf: imageURI)
                                        DispatchQueue.main.async {
                                            
                                            self.AdvertiseImage.image = UIImage(data: data!)
                                        
                                            self.getPhone()
                                        }
                                    }
                                }
                            }
                            //self.MyView.reloadData()
                        }
                    }
                    
                case .failure(_):
                    
                    print("Error message:\(response.result.error)")
                    break
                    
                }
            }
            .responseString { response in
                print("String:\(response.result.value)")
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value{
                        print(data)
                    }
                    
                case .failure(_):
                    print("Error message:\(response.result.error)")
                    break
                }
        }
        
    }
    
    
    func getPhone(){
        Alamofire.request(connection().getUrl(word: "getPhone"))
            
            .responseJSON { response in
                // print("JSON:\(response.result.value)")
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value as? [[String : Any]]{
                        
                        for item in data {
                            GlobalVariables.sharedManager.phoneNumber = item["phone"] as! String
                        }
//                        self.logo.isHidden = true
//                        self.AddvertiseDialog.isHidden=false
                    }
                    
                case .failure(_):
                    
                    print("Error message:\(response.result.error)")
                    break
                    
                }
            }
            .responseString { response in
                print("String:\(response.result.value)")
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value{
                        print(data)
                    }
                    
                case .failure(_):
                    print("Error message:\(response.result.error)")
                    break
                }
        }
        
    }
    @IBAction func toMenuAction(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "toMenu", sender: nil)
        
    }

}
