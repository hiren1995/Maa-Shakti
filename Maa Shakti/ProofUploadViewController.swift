//
//  ProofUploadViewController.swift
//  Maa Shakti
//
//  Created by Apple on 19/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import CropViewController

class ProofUploadViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,CropViewControllerDelegate {

    @IBOutlet var imgCandidatePic: UIImageView!
    @IBOutlet var imgIDProofPic: UIImageView!
    @IBOutlet var imgAdressProofPic: UIImageView!
    
    
    @IBOutlet var txtIDProof: UITextField!
    @IBOutlet var txtAddressProof: UITextField!
    
    @IBOutlet var lblWarningIDProof: UILabel!
    @IBOutlet var lblWarningAddressProof: UILabel!
    
    @IBOutlet var imgIDProofLine: UIImageView!
    @IBOutlet var imgAdressProofLine: UIImageView!
    
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet var btnCandidatePic: UIButton!
    @IBOutlet var btnIDProofPic: UIButton!
    @IBOutlet var btnAddressProofPic: UIButton!
    
    
    var imgButton = String()
    
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
    
    @IBAction func SelectImage(_ sender: UIButton) {
        
        if(sender == btnCandidatePic)
        {
            imgButton = "Candidate"
        }
        else if(sender == btnIDProofPic)
        {
            imgButton = "ID"
        }
        else
        {
            imgButton = "Address"
        }
        
        uploadPic()
    }
    
    func uploadPic(){
        
        var alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        var cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        var gallaryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallary()
        }
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        {
            UIAlertAction in
        }
        
        imagePicker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alertWarning = UIAlertView(title:"Warning", message: "You don't have camera", delegate:nil, cancelButtonTitle:"OK", otherButtonTitles:"")
            alertWarning.show()
        }
    }
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            
            //profileImg.image = image
            
            self.dismiss(animated: true, completion: nil)
            let cropViewController = CropViewController(image: image)
            cropViewController.delegate = self
            present(cropViewController, animated: true, completion: nil)
            
            
        } else{
            print("Something went wrong")
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        
        //imgProfilePic.image = image
        
        if(imgButton == "Candidate")
        {
            imgCandidatePic.image = image
        }
        else if(imgButton == "ID")
        {
            imgIDProofPic.image = image
        }
        else
        {
           imgAdressProofPic.image = image
        }
        
        dismiss(animated: true, completion: nil)
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
