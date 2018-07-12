//
//  DashBoardViewController.swift
//  Maa Shakti
//
//  Created by Apple on 12/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController {

    @IBOutlet var imgGirl: UIImageView!
    @IBOutlet var imgBoy: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        toAnimate()
        
    }
    
    @IBAction func btnMenuTapped(_ sender: UIButton) {
        
        let slidemenu = self.slideMenuController()
        
        slidemenu?.openLeft()
    }
    
    
    func toAnimate()
    {
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseOut, animations: {
            
            self.imgGirl.transform = CGAffineTransform(rotationAngle: (20 * 3.14)/180)
            
            self.imgBoy.transform = CGAffineTransform(rotationAngle: (-20 * 3.14)/180)
            
            
        }) { (true) in
            
            self.froAnimate()
            
        }
        
    }
    
    func froAnimate()
    {
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseOut, animations: {
            
            self.imgGirl.transform = CGAffineTransform(rotationAngle: (-20 * 3.14)/180)
            
            self.imgBoy.transform = CGAffineTransform(rotationAngle: (20 * 3.14)/180)
            
            
            
        }) { (true) in
            
            
            self.toAnimate()
            
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
