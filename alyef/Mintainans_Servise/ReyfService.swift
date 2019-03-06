//
//  ReyfService.swift
//  alyef
//
//  Created by iMac on 2019/03/06.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit
import TransitionButton
class ReyfService: UIViewController {

    @IBOutlet weak var goBut: TransitionButton!
    @IBOutlet weak var note: UITextField!
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Contnue(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func Advertise_but(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toServise", sender: nil)
    }
}
