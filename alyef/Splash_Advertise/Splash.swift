//
//  Splash.swift
//  sudia_zabayih
//
//  Created by iMac on 2019/01/24.
//  Copyright © 2019 awad. All rights reserved.
//
import Foundation
import UIKit
extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
class Splash: UIViewController {
    
        override func viewDidLoad() {
            super.viewDidLoad()
            sleep(1)
            
            
            self.performSegue(withIdentifier: "toAdvetise", sender: nil)
            //deleteAllRecords()
        
            // Do any additional setup after loading the view.
        }
   
}
