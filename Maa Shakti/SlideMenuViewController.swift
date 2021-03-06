//
//  SlideMenuViewController.swift
//  Maa Shakti
//
//  Created by Apple on 12/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

var FromVC = 0

class SlideMenuViewController: SlideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func awakeFromNib() {
        
        if(FromVC == 0)
        {
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "dashBoardViewController") {
                self.mainViewController = controller
            }
        }
        else if(FromVC == 1)
        {
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "confirmViewController") {
                self.mainViewController = controller
                
            }
        }
        else if(FromVC == 2)
        {
            
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "personalDetailsViewController") {
                self.mainViewController = controller
                
            }
        }
        
        else if(FromVC == 3)
        {
            
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "addressDetailsViewController") {
                self.mainViewController = controller
                
            }
        }
        
        else if(FromVC == 4)
        {
            
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "proofUploadViewController") {
                self.mainViewController = controller
                
            }
        }
        
        
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "menuViewController") {
            self.leftViewController = controller
        }
        super.awakeFromNib()
        
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
