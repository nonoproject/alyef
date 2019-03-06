//
//  API.swift
//  Poster
//
//  Created by MAC on 01/01/2019.
//  Copyright © 2019 MAC. All rights reserved.
//


import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

public class API {

    open func getAll(endUrl: String, onCompletion: ((Any?) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
//        print(endUrl)
        Alamofire.request(endUrl, method: .get).responseJSON { response in
//            print(response)
            switch response.result {
            case .success(let result):
                
//                print(result!)
                guard let json = JSON(result).array else{
                    let err = NSError(domain: "\(endUrl)", code: 1, userInfo: [NSLocalizedDescriptionKey: "not in good format json"])
                    //let err = "not in good format"
                    onError!(err)
                    return
                }
                
                onCompletion?(json)
            case .failure(let err):
                print("\(err.localizedDescription)")
                onError?(err)
            }
        }
    }
    
    
    
    /*
     func uploadFile()
     use to uploade file
     with parameters:
     - endurl: where data will be send
     - fileData: specific data representation of file to be send
     - withName: file name
     - parameters: othr parameters need to send with
     
     + onCompletion: when upload is success
     + onError: when upload is failure
     */
    
    func uploadFile(endUrl: String, fileData: Data?,withName: String, parameters: [String : Any], onCompletion: ((Any?) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
        
        let headers: HTTPHeaders = [
            "Content-type": "multipart/form-data"
        ]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            if let data = fileData{
                multipartFormData.append(data, withName: withName,fileName: "image.png", mimeType: "image/png")
            }
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: endUrl, method: .post, headers: headers) { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    if let err = response.error{
                        onError?(err)
                        return
                    }
                    onCompletion?(response.value)
                }
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
                onError?(error)
            }
        }
    }


    func dwonloadImage(endUrl: String, onCompletion: ((UIImage?) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
        
        Alamofire.request(endUrl)
            .responseImage { response in
                switch response.result {
                case .success:
                    if let image = response.result.value {
                        
                        onCompletion?(image)
                    }
                case .failure(let err):
                    print("\(err.localizedDescription)")
                    onError?(err)
                }
        }
    }


    public class ImageLoader {
        
        private static let cache = NSCache<NSString, NSData>()
        
        class func image(for url: URL, completionHandler: @escaping(_ image: UIImage?) -> ()) {
            
            DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
                
                if let data = self.cache.object(forKey: url.absoluteString as NSString) {
                    DispatchQueue.main.async { completionHandler(UIImage(data: data as Data)) }
                    return
                }
                
                guard let data = NSData(contentsOf: url) else {
                    DispatchQueue.main.async { completionHandler(nil) }
                    return
                }
                
                self.cache.setObject(data, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async { completionHandler(UIImage(data: data as Data)) }
            }
        }
        
    }

}

class Glubal {
    var BaseUrl:String = "https://muhana9.com/markapp/app/show/"
    var CategoryJson:[JSON] = [JSON]()
    var CategoryCount:Int = 0
    
    var Obj = API()
    
    func loadCategory(category:Int,onCompletion: ((Any?) -> Void)? = nil) {
        
        let url = self.BaseUrl+"categories.php"
        
        if CheckInternet.Connection(){
            Obj.getAll(endUrl: url, onCompletion: { (json) in
                
                self.CategoryJson = json! as! [JSON]
                self.CategoryCount = self.CategoryJson.count
                
                onCompletion!(self.CategoryJson)
                
            }) { (err) in
                if self.CategoryJson == [] && self.CategoryCount == 0 {
                    
                    self.CategoryJson = []
                    self.CategoryCount = 0
                    
                }
                
            }
        }else{
            
            if self.CategoryJson == [] && self.CategoryCount == 0 {
                
                self.CategoryJson = []
                self.CategoryCount = 0
                
            }
        }
        
    }
    
//    var bannerImages = [:]
    var bannerJson = [JSON]()
    
    func banner (onCompletion: ((Any?) -> Void)? = nil){
        let url = self.BaseUrl+"banner.php"
        
        if CheckInternet.Connection(){
            Obj.getAll(endUrl: url, onCompletion: { (json) in
                
                self.bannerJson = json! as! [JSON]
                
                onCompletion!(self.bannerJson)
                
            }) { (err) in
                
                self.bannerJson = []
            }
        }else{
            self.bannerJson = []
        }
        
    }
    
}
