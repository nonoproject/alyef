//
//  GlobalVariables.swift
//  Medhyaf
//
//  Created by iMac on 2018/11/26.
//  Copyright © 2018 fahd aldobian. All rights reserved.
//

import UIKit
class GlobalVariables {
    
    // These are the properties you can store in your singleton
    var depart: String = "غداء"
    var productId: String = "غداء"
    var phoneNumber: String = "09"
     var userName: String = ""
     var UserOhone: String = ""
    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
