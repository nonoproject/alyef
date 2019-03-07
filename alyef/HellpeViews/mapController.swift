//
//  mapController.swift
//  alyef
//
//  Created by iMac on 2019/03/07.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit
import MapKit
class mapController: UIViewController {
    
    @IBOutlet weak var myMap: MKMapView!
    ///////////// map view ////////////
    @IBAction func closeMapView(_ sender: Any) {
        if (UserDefaults.standard.value(forKey: "alertRegesterForm") != nil)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "alertRegesterForm")
            self.present(vc!, animated: true, completion: nil)
            
        }
        else{
            
        }
    }
    
    
    ////////////////////////////////
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

extension ServicePrice:MKMapViewDelegate{
    
}
