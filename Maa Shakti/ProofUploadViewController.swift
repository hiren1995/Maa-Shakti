//
//  ProofUploadViewController.swift
//  Maa Shakti
//
//  Created by Apple on 19/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import CropViewController

class ProofUploadViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,CropViewControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    
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
    
    @IBOutlet var ProofsTableView: UITableView!
    @IBOutlet var AplhaView: UIView!
    
    var SelectiontxtBox = "ID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblWarningIDProof.isHidden = true
        lblWarningAddressProof.isHidden = true
        
        ProofsTableView.delegate = self
        ProofsTableView.dataSource = self
        
        ProofsTableView.isHidden = true
        AplhaView.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMenuTapped(_ sender: UIButton) {
        
        let slidemenu = self.slideMenuController()
        
        slidemenu?.openLeft()
    }
    
    @IBAction func btnPrivacyURLTapped(_ sender: UIButton) {
        
        guard let url = URL(string: privacyURL) else {
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
        
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
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
    
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        
        if(txtIDProof.text == "" || txtAddressProof.text == "" || imgCandidatePic.image == UIImage(named: "user_placeholder") || imgIDProofPic.image == UIImage(named: "placeholder") || imgAdressProofPic.image == UIImage(named: "placeholder"))
        {
            if(txtIDProof.text == "")
            {
                lblWarningIDProof.isHidden = false
                imgIDProofLine.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningIDProof.isHidden = true
                imgIDProofLine.backgroundColor = ColorPrimary
            }
            
            if(txtAddressProof.text == "")
            {
                lblWarningAddressProof.isHidden = false
                imgAdressProofLine.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningAddressProof.isHidden = true
                imgAdressProofLine.backgroundColor = ColorPrimary
            }
            
            if(imgCandidatePic.image == UIImage(named: "user_placeholder"))
            {
                self.showAlert(Title: "Alert", Message: "Please select Image")
            }
            
            if(imgIDProofPic.image == UIImage(named: "placeholder"))
            {
                self.showAlert(Title: "Alert", Message: "Please select Image")
            }
            if(imgAdressProofPic.image == UIImage(named: "placeholder"))
            {
                self.showAlert(Title: "Alert", Message: "Please select Image")
            }
        }
        else
        {
            
        }
        
    }
    @IBAction func btnBackTapped(_ sender: UIButton) {
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(SelectiontxtBox == "ID")
        {
            return IDProofArray.count
        }
        else
        {
            return AddressProofArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ProofsTableView.dequeueReusableCell(withIdentifier: "areaTableViewCell", for: indexPath) as! AreaTableViewCell
        
        if(SelectiontxtBox == "ID")
        {
            cell.lblAreaName.text = IDProofArray[indexPath.row]
        }
        else
        {
            cell.lblAreaName.text = AddressProofArray[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = ProofsTableView.cellForRow(at: indexPath) as! AreaTableViewCell
        
        if(SelectiontxtBox == "ID")
        {
            txtIDProof.text = cell.lblAreaName.text
            
            lblWarningIDProof.isHidden = true
            imgIDProofLine.backgroundColor = ColorPrimary
            
        }
        else
        {
            txtAddressProof.text = cell.lblAreaName.text
            
            lblWarningAddressProof.isHidden = true
            imgAdressProofLine.backgroundColor = ColorPrimary
        }
        
        ProofsTableView.isHidden = true
        AplhaView.isHidden = true
        self.view.endEditing(true)
    }
    
    @IBAction func txtSelectionBegin(_ sender: UITextField) {
        
        if(sender == txtIDProof)
        {
            SelectiontxtBox = "ID"
            
        }
        else
        {
            SelectiontxtBox = "Address"
        }
        
        ProofsTableView.reloadData()
        ProofsTableView.isHidden = false
        AplhaView.isHidden = false
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
