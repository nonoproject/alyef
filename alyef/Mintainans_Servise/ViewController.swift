//
//  ViewController.swift
//  alyef
//
//  Created by iMac on 2019/03/07.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("awad say \(iteams.count)")
        return iteams.count
        
    }
    
    func sendMessage(){
        var url:String = "http://www.hisms.ws/api.php?"
            + "send_sms"
            + "&username=xxx966537811200"
            + "&password=xxxas334as334"
            + "&sender=" + "xxxihjeez"
            + "&numbers=" + "phone"
            + "&message=" + "URLEncoder.encode(s_msg)"
            + "&date=" + "";
    }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "medhyafCell", for: indexPath as IndexPath) as! MCollectionViewCell
        //    cell.backgroundColor = UIColor.white // make cell more visible in our example project
        
        if iteams[indexPath.row].image != nil {
            if let imageURI = URL(string: ("https://medhyafapp.com/ref/uploads/"+iteams[indexPath.row].image!)) {
                //print("It's a photo!")
                DispatchQueue.global(qos: .background).async {
                    let data = try? Data(contentsOf: imageURI)
                    DispatchQueue.main.async {
                        if data != nil{
                            
                            cell.Image?.image = UIImage(data: data!)
                        }
                        
                    }
                }
            }
        }
        cell.label.text=iteams[indexPath.row].label
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        //print("You selected cell #\(indexPath.item)!")
        GlobalVariables.sharedManager.productId=iteams[indexPath.row].id!;
        self.performSegue(withIdentifier: "toServise", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //  dismiss(animated: true, completion: nil)
        if segue.identifier == "toServise" {
            if let viewController = segue.destination as? ReyfService {
                
                viewController.productId = GlobalVariables.sharedManager.productId as! String
                
            }
        }
    }








    @IBOutlet weak var myCollection: UICollectionView!
//    @IBOutlet weak var myTableView: UICollectionView!
    var iteams=Array<jsonData>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getData(){
        Alamofire.request("http://medhyafapp.com/ref/app/show/categories.php?x=y")
            
            .responseJSON { response in
                //print("JSON:\(response.result.value)")
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value as? [[String : Any]]{
                        for item in data {
                            // self.nameArray.append(naitem["item_id"] as! String)
                            self.iteams.append(jsonData(id: item["id"] as! String  ,image: item["image"]as!String, label: item["name"]as!String))
                            //self.fullTableView()
                            print("JSON:\( item["name"]as!String)")
                            
                            //
                            
                        }
                        self.myCollection.reloadData()
                    }
                    
                case .failure(_):
                    
                    print("Error message:\(response.result.error)")
                    break
                    
                }
            }
            .responseString { response in
                //print("String:\(response.result.value)")
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value{
                        // print(data)
                    }
                    
                case .failure(_):
                    //print("Error message:\(response.result.error)")
                    break
                }
        }
        
    }
    
}
//extension  ViewController:
