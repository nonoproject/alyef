//
//  Splash.swift
//  sudia_zabayih
//
//  Created by iMac on 2019/01/24.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit
import TransitionButton
import Toast_Swift
class Splash: UIViewController {

    @IBOutlet weak var reload_t: TransitionButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       // print("higg \(CheckInternet.Connection())")
        if(CheckInternet.Connection()){
            
            perform(#selector(Splash.splashtohome), with: nil, afterDelay: 3)
            
        }
        else{
            sleep(3)
            reload_t.isHidden=false
//          self.performSegue(withIdentifier: "toHome", sender: nil)
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func reload(_ sender: Any) {
        reload_t.startAnimation()
        
    reload_t.spinnerColor = .white

        if(CheckInternet.Connection()){
            
            perform(#selector(Splash.splashtohome), with: nil, afterDelay: 0)
            
        }
        sleep((1))
        reload_t.stopAnimation()
        
    }
    
    @objc func splashtohome(){
       
            performSegue(withIdentifier: "toHome", sender:self)
    
    }

    /*
    // MARK: - Navigation
*/
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
