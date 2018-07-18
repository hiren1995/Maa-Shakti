//
//  PersonalDetailsViewController.swift
//  Maa Shakti
//
//  Created by Apple on 13/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

//import FSCalendar

//class PersonalDetailsViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource{
    
class PersonalDetailsViewController: UIViewController{
    
    //@IBOutlet var CalenderView: FSCalendar!
    
    @IBOutlet var txtFirstName: UITextField!
    @IBOutlet var txtLastName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtMobileNumber: UITextField!
    @IBOutlet var txtDOB: UITextField!
    
    
    
    
    var datePickerView  : UIDatePicker = UIDatePicker()
    
    @IBOutlet var imgFName: UIImageView!
    @IBOutlet var imgLName: UIImageView!
    @IBOutlet var imgMNumber: UIImageView!
    @IBOutlet var imgEmail: UIImageView!
    @IBOutlet var imgDOB: UIImageView!
    
    
    @IBOutlet var lblWarningFName: UILabel!
    @IBOutlet var lblWarningLName: UILabel!
    @IBOutlet var lblWarningMNumber: UILabel!
    @IBOutlet var lblWarningEmail: UILabel!
    @IBOutlet var lblWarningDOB: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //CalenderView.delegate = self
        //CalenderView.dataSource = self
        
        //CalenderView.isHidden = true
        
        addDoneButtonOnTextField()
        
        lblWarningFName.isHidden = true
        lblWarningLName.isHidden = true
        lblWarningMNumber.isHidden = true
        lblWarningEmail.isHidden = true
        lblWarningDOB.isHidden = true
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMenuTapped(_ sender: UIButton) {
        
        let slidemenu = self.slideMenuController()
        
        slidemenu?.openLeft()
    }
    
    @IBAction func txtDOBEditingBegin(_ sender: UITextField) {
        
        
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        txtDOB.inputAccessoryView = toolbar
        
        
    }
    @objc func handleDatePickertxtStart(sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        txtDOB.text = dateFormatter.string(from: sender.date)
        
    }
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtDOB.text = formatter.string(from: datePickerView.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    func addDoneButtonOnTextField()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(cancelTextField))
        
        let items = NSMutableArray()
        items.add(flexSpace)
        items.add(done)
        
        doneToolbar.items = items as! [UIBarButtonItem]
        doneToolbar.sizeToFit()
        
        txtFirstName.inputAccessoryView = doneToolbar
        txtLastName.inputAccessoryView = doneToolbar
        txtMobileNumber.inputAccessoryView = doneToolbar
        txtEmail.inputAccessoryView = doneToolbar
        
    }
    @objc func cancelTextField(){
        self.view.endEditing(true)
        
    }
    
   
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        
        if(txtFirstName.text == "" || txtLastName.text == "" || txtMobileNumber.text == "" || txtEmail.text == "" || txtDOB.text == "")
        {
            if(txtFirstName.text == "")
            {
                lblWarningFName.isHidden = false
                imgFName.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningFName.isHidden = true
                imgFName.backgroundColor = ColorPrimary
            }
            
            
            if(txtLastName.text == "")
            {
                
                lblWarningLName.isHidden = false
                imgLName.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningLName.isHidden = true
                imgLName.backgroundColor = ColorPrimary
                
            }
            
            if(txtMobileNumber.text == "")
            {
                lblWarningMNumber.isHidden = false
                imgMNumber.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningMNumber.isHidden = true
                imgMNumber.backgroundColor = ColorPrimary
            }
            
            if(txtEmail.text == "")
            {
                lblWarningEmail.isHidden = false
                imgEmail.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningEmail.isHidden = true
                imgEmail.backgroundColor = ColorPrimary
            }
            
            if(txtDOB.text == "")
            {
                
                lblWarningDOB.isHidden = false
                imgDOB.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningDOB.isHidden = true
                imgDOB.backgroundColor = ColorPrimary
                
            }
            
        }
        else
        {
            if isValidEmail(testStr: txtEmail.text!)
            {
                if isvalidPhoneNumber(value: txtMobileNumber.text!)
                {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let addressDetailsViewController = storyboard.instantiateViewController(withIdentifier: "addressDetailsViewController") as! AddressDetailsViewController
                    
                    self.present(addressDetailsViewController, animated: true, completion: nil)
                }
                else
                {
                    lblWarningMNumber.isHidden = false
                    imgMNumber.backgroundColor = UIColor.red
                    lblWarningMNumber.text = "Please Enter Valid Phone Number"
                }
            }
            else
            {
                lblWarningEmail.isHidden = false
                imgEmail.backgroundColor = UIColor.red
                lblWarningEmail.text = "Please Enter Valid Email"
            }
            
            
            
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let addressDetailsViewController = storyboard.instantiateViewController(withIdentifier: "addressDetailsViewController") as! AddressDetailsViewController
//
//            self.present(addressDetailsViewController, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func txtEditingEnd(_ sender: UITextField) {
        
        if(sender == txtFirstName)
        {
            if(sender.text != "")
            {
                lblWarningFName.isHidden = true
                imgFName.backgroundColor = ColorPrimary
            }
            else
            {
                lblWarningFName.isHidden = false
                imgFName.backgroundColor = UIColor.red
            }
            
        }
        
        if(sender == txtLastName)
        {
            if(sender.text != "")
            {
                lblWarningLName.isHidden = true
                imgLName.backgroundColor = ColorPrimary
            }
            else
            {
                lblWarningLName.isHidden = false
                imgLName.backgroundColor = UIColor.red
            }
        }
        
        if(sender == txtMobileNumber)
        {
            if(sender.text != "")
            {
                if isvalidPhoneNumber(value: sender.text!)
                {
                    lblWarningMNumber.isHidden = true
                    imgMNumber.backgroundColor = ColorPrimary
                }
                else
                {
                    lblWarningMNumber.isHidden = false
                    imgMNumber.backgroundColor = UIColor.red
                    lblWarningMNumber.text = "Please Enter Valid Phone Number"
                }
                
            }
            else
            {
                lblWarningMNumber.isHidden = false
                imgMNumber.backgroundColor = UIColor.red
            }
        }
        
        if(sender == txtEmail)
        {
            if(sender.text != "")
            {
                if isValidEmail(testStr: txtEmail.text!)
                {
                    lblWarningEmail.isHidden = true
                    imgEmail.backgroundColor = ColorPrimary
                }
                else
                {
                    lblWarningEmail.isHidden = false
                    imgEmail.backgroundColor = UIColor.red
                    lblWarningEmail.text = "Please Enter Valid Email"
                }
                
            }
            else
            {
                lblWarningEmail.isHidden = false
                imgEmail.backgroundColor = UIColor.red
            }
        }
        if(sender == txtDOB)
        {
            if(sender.text != "")
            {
                lblWarningDOB.isHidden = true
                imgDOB.backgroundColor = ColorPrimary
            }
            else
            {
                lblWarningDOB.isHidden = false
                imgDOB.backgroundColor = UIColor.red
            }
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
