//
//  ConfirmViewController.swift
//  Maa Shakti
//
//  Created by Apple on 12/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {

    @IBOutlet var imgTick: UIImageView!
    var TickFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnTickTapped(_ sender: UIButton) {
        
        if TickFlag
        {
            TickFlag = false
            imgTick.image = nil
        }
        else
        {
            TickFlag = true
            imgTick.image = UIImage(named: "tick")
        }
        
    }
    
    @IBAction func btnMenuTapped(_ sender: UIButton) {
        
        let slidemenu = self.slideMenuController()
        
        slidemenu?.openLeft()
    }
    
    @IBAction func btnAgreeTapped(_ sender: UIButton) {
        
        
        if TickFlag
        {
            FromVC = 2
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let slideMenuViewController = storyboard.instantiateViewController(withIdentifier: "slideMenuViewController") as! SlideMenuViewController
            self.present(slideMenuViewController, animated: true, completion: nil)
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
