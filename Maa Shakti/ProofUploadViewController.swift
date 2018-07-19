//
//  ProofUploadViewController.swift
//  Maa Shakti
//
//  Created by Apple on 19/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ProofUploadViewController: UIViewController {

    @IBOutlet var imgCandidatePic: UIImageView!
    @IBOutlet var imgIDProofPic: UIImageView!
    @IBOutlet var imgAdressProofPic: UIImageView!
    
    
    @IBOutlet var txtIDProof: UITextField!
    @IBOutlet var txtAddressProof: UITextField!
    
    @IBOutlet var lblWarningIDProof: UILabel!
    @IBOutlet var lblWarningAddressProof: UILabel!
    
    @IBOutlet var imgIDProofLine: UIImageView!
    @IBOutlet var imgAdressProofLine: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnMenuTapped(_ sender: UIButton) {
        
        let slidemenu = self.slideMenuController()
        
        slidemenu?.openLeft()
    }
    
    @IBAction func btnPrivacyURLTapped(_ sender: UIButton) {
        
        guard let url = URL(string: "https://mashakti.com/privacy") else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
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
