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
    
    let baseUrl="http://lifeway.com.sa/api/"
    let LarvelbaseUrl="http://tatbiqati.com/api/"
    
    let baseImageUrl="http://tatbiqati.com/public/images/"
    let baseChatImage="http://tatbiqati.com/public/upload/image/"
    
    let LarvelbaseUrl_uploade="http://tatbiqati.com/api/upload"
    ////http://lifeway.com.sa/mostaql/api/login?email=sa&password=ssss
    //    let LarvelbaseUrl="http://192.168.8.102/mostaql/api/"
    //    let baseUrl="http://192.168.8.102/api/"
    //    let baseImageUrl="http://192.168.8.102/mostaql/public/images/"
    //     let baseChatImage="http://192.168.8.102/mostaql/public/upload/image/"
    //
    //      let LarvelbaseUrl_uploade="http://192.168.8.102/mostaql/api/upload"
    func  getUrl(word:String) -> String{
        var link:String =    ""
        switch word {
        case "Login":
            link = baseUrl+"Show/Login.php?x=y&Username="
            break
            
        case "resand_varification_code":
            link = LarvelbaseUrl+"resend_code"
            break
        case "Login_":
            link = LarvelbaseUrl+"login"
            break
        case "varify":
            link = LarvelbaseUrl+"code"
            break
        case "LarvelbaseUrl_uploade":
            link = LarvelbaseUrl_uploade
            break
            
        case "Registraton":
            link = LarvelbaseUrl+"register"
            break
        case "Service":
            link = baseUrl+"Show/categories.php?x=y"
            break
        case "Catogry":
            link = baseUrl+"Show/products.php?x=y&category_id="
            break
        case "ServiceDescription":
            link = baseUrl+"Show/Services.php?x=y&"
            break
        case "chatRoom":
            //link = baseUrl+"Show/chatRoom.php?x=y&clinte_id="
            link = LarvelbaseUrl+"chat_room?client_id="
            break
        case "all_chat_room":
            //link = baseUrl+"Show/chatRoom.php?x=y&clinte_id="
            link = LarvelbaseUrl+"all_chats?user_id="
            break
            
        case "addNewGig":
            //link = baseUrl+"Show/chatRoom.php?x=y&clinte_id="
            link = LarvelbaseUrl+"addGig"
            break
            
        case "SeandOrder":
            link = baseUrl+"write/SeandOrder.php?SeanderID="
            break
        case "GetMyOffer":
            link = LarvelbaseUrl+"user_orders?user_id="
            break
        case "GetServiceAndCatogry":
            link = LarvelbaseUrl+"services"
            break
        case "AppImage":
            link =  baseImageUrl
            break
        case "UploadImage":
            link =  baseUrl+"upload"
            break
        case "chatImageImage":
            link =  baseChatImage
            break
        case "get_orders_client":
            link =  LarvelbaseUrl+"get_offer"
            break
        ////////////////////////////////////////////////////////////
        case "chat_rooms"://get only count of unread message
            link = LarvelbaseUrl+"chat_rooms?user_id="
            break
        case "chat_room"://get  count of unread message and user name and
            link = LarvelbaseUrl+"chat_room?user_id="
            break
        case "chat_count":
            link = LarvelbaseUrl+"chat_count?user_id="
            break
            
        case "chat_data":
            link = LarvelbaseUrl+"chat_data?user_id="
            break
        case "SeandMessage":
            link = baseUrl+"write/insert_new_message.php?SeanderID="
            break
        case "addMessage":
            link = LarvelbaseUrl+"addMessage?SeanderID="
            break
        case "last_message":
            //        link = "http://192.168.8.105/mostaql/api/last_messages?"
            link = LarvelbaseUrl+"last_messages?"
            break
        ///////////////////////////////////////////////////////////////
        case "getGigs":
            link = LarvelbaseUrl+"getGigs?user_id="
            break
        case "get_orders":
            link = LarvelbaseUrl+"get_orders?category_id="
            break
        case "gig_disactive":
            link = LarvelbaseUrl+"disactive?id="
            break
        case "gig_active":
            link = LarvelbaseUrl+"active?id="
            break
        case "has_offer":
            link = LarvelbaseUrl+"has_offer?"
            break
        case "add_developer_offer":
            link = LarvelbaseUrl+"add_offer?"
            break
            
        default:
            break
            
            
            
        }
        return link
        
    }
}
