//
//  SysConnection.swift
//  sudia_zabayih
//
//  Created by iMac on 2019/01/24.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit

class connection:NSData
{
    
    let Base_Url:String = "https://medhyafapp.com/ref/app/"
    func getUrl(word:String) -> String{
        var Slim_word:String=""
        switch word {
        case "getAddvertiseImage":
            Slim_word="https://medhyafapp.com/ref/app/show/ads.php"
            break
        case "getAddvertiseImageLink":
            Slim_word="https://medhyafapp.com/ref/uploads/"
            break
        case "getPhone":
            Slim_word="http://medhyafapp.com/ref/app/show/org.php"
            break
        default: break
            /*
             http://medhyafapp.com/ref/app/
             http://medhyafapp.com/ref/app/show
             http://medhyafapp.com/ref/app/write
             http://medhyafapp.com/ref/uploads/
             */
        }
        return Base_Url+Slim_word
    }
}
