//
//  SysJsonData.swift
//  sudia_zabayih
//
//  Created by iMac on 2019/01/24.
//  Copyright © 2019 awad. All rights reserved.
//

import Foundation

class Zabiha {
    var Zabiha_imageUrl:String?
    var Zabiha_titel:String?
    var Zabiha_id:Int?
    init(Zabiha_id:Int,Zabiha_imageUrl:String,Zabiha_titel:String){
        self.Zabiha_imageUrl=Zabiha_imageUrl
        self.Zabiha_titel=Zabiha_titel
        self.Zabiha_id=Zabiha_id
    }
    
}
class city{
    var city_name:String?
    init(city_name:String){
        self.city_name=city_name
    }
}
class orders {
    var status:String?
    var date_time:String?
     var mymessage:String?
     var phone:String?
    var id:Int?
    
    init(id:Int,status:String,date_time:String,mymessage:String,phone:String){
        self.status=status
        self.date_time=date_time
        self.id=id
        self.mymessage=mymessage
         self.phone=phone
        
    }
    
}
