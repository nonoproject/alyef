//
//  ViewController.swift
//  alyef
//
//  Created by iMac on 2019/03/04.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var adertise_Service: DesignableButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func Advertise_but(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toServise", sender: nil)
    }
    
}

