//
//  jsonData.swift
//  Medhyaf
//
//  Created by iMac on 2018/11/21.
//  Copyright © 2018 fahd aldobian. All rights reserved.
//

import Foundation
class jsonData {
    var image:String?
    var label:String?
    var id:String?
    init(id:String,image:String,label:String){
        self.image=image
        self.label=label
        self.id=id
    }
   


    

}
class iteamsJsonData{
    var main_image:String?
    var offerImage:String?
    var titel:String?
    var price:String?
    var original_price:String?
    var offer_price:String?
 var quantity:String?
    var status:String?

    init(main_image:String,offerImage:String,titel:String,price:String,original_price:String,offer_price:String,status:String,quantity:String){
        self.main_image=main_image
        self.offerImage=offerImage
        self.titel=titel
        self.price=price
        self.offer_price=offer_price
         self.quantity=quantity
         self.status=status
}
}
class BasketJsonData{
      var titel:String?
    var id:String?
    var price:Double?
        var quantity:Int??
    var note:String?

    
    init(price:Double,titel:String,quantity:Int,id:String,note:String){
        self.titel=titel
        self.price=price
        self.quantity=quantity
         self.id=id
        self.note=titel
    }
}
class BasketJsonDatac{
    var titel:String?
    var id:String?
    var price:String
    var quantity:String?
    
    
    init(price:String,titel:String,quantity:String,id:String){
        self.titel=titel
        self.price=price
        self.quantity=quantity
        self.id=id
    }
}
    class BasketJsonDataToSend{
        var name:String?
        var price:Int?
        var quantity:Int?
        var note:String?
        
        init(price:Int,name:String,quantity:Int,note:String){
            self.name=name
            self.price=price
            self.quantity=quantity
            self.note=note
        }
}
class BasketJsonDataToSendc{
    var name:String?
    var price:String
    var quantity:String?
    
    
    init(price:String,name:String,quantity:String){
        self.name=name
        self.price=price
        self.quantity=quantity
        
    }
}

