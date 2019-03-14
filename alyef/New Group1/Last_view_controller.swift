//
//  Last_view_controller.swift
//  alyef
//
//  Created by iMac on 2019/03/07.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit

class Last_view_controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    ///////////// fenish view ////////////
    @IBAction func OrderDone(_ sender: Any) {  
        self.navigationController?.popViewController(animated: true)
    }
  
    ///////////////////////////////////

}
