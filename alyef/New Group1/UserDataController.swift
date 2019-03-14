//
//  UserDataController.swift
//  alyef
//
//  Created by iMac on 2019/03/07.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit

class UserDataController: UIViewController {
    ///////////// map view ////////////
    
    @IBOutlet weak var client_phonee: UITextField!
    @IBOutlet weak var client_city: UITextField!
    @IBOutlet weak var client_date: UITextField!
    @IBOutlet weak var client_name: UITextField!
    
    @IBAction func sendOrder(_ sender: Any) {
        if (UserDefaults.standard.value(forKey: "alertDone") != nil)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "alertDone")
            self.present(vc!, animated: true, completion: nil)
            
        }
        else{
            
        }
    }
    
    @IBAction func send_order_using_whatsapp(_ sender: Any) {
        if (UserDefaults.standard.value(forKey: "alertDone") != nil)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "alertDone")
            self.present(vc!, animated: true, completion: nil)
            
        }
        else{
            
        }
    }
    /////////////////////////
    @IBAction func back(_ sender: Any) {
          self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
