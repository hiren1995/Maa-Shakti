//
//  AddressDetailsViewController.swift
//  Maa Shakti
//
//  Created by Apple on 13/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SwiftyJSON

class AddressDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,XMLParserDelegate
{
    
    @IBOutlet var txtHouseNo: UITextField!
    @IBOutlet var txtSociety: UITextField!
    @IBOutlet var txtLandmark: UITextField!
    @IBOutlet var txtArea: UITextField!
    @IBOutlet var txtCity: UITextField!
    
    @IBOutlet var imgHouseNo: UIImageView!
    @IBOutlet var imgSociety: UIImageView!
    @IBOutlet var imgLandmark: UIImageView!
    @IBOutlet var imgArea: UIImageView!
    
    @IBOutlet var lblWarningHouseNo: UILabel!
    @IBOutlet var lblWarningSociety: UILabel!
    @IBOutlet var lblWarningLandmark: UILabel!
    @IBOutlet var lblWarningArea: UILabel!
    @IBOutlet var lblWarningCity: UILabel!
    
    
    @IBOutlet var ViewAlpha: UIView!
    @IBOutlet var AreaTableView: UITableView!
    
    let fileName = "areas"
    
    var AreasArray = JSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        AreaTableView.delegate = self
        AreaTableView.dataSource = self
        
        parseJSON()
        
        ViewAlpha.isHidden = true
        AreaTableView.isHidden = true
        
        lblWarningArea.isHidden = true
        lblWarningLandmark.isHidden = true
        lblWarningSociety.isHidden = true
        lblWarningHouseNo.isHidden = true
        lblWarningCity.isHidden = true
        
        addDoneButtonOnTextField()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        
        if(txtHouseNo.text == "" || txtSociety.text == "" || txtLandmark.text == "" || txtArea.text == "" || txtCity.text == "")
        {
            if(txtHouseNo.text == "")
            {
                lblWarningHouseNo.isHidden = false
                imgHouseNo.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningHouseNo.isHidden = true
                imgHouseNo.backgroundColor = ColorPrimary
            }
            
            
            if(txtSociety.text == "")
            {
                
                lblWarningSociety.isHidden = false
                imgSociety.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningSociety.isHidden = true
                imgSociety.backgroundColor = ColorPrimary
                
            }
            
            if(txtLandmark.text == "")
            {
                lblWarningLandmark.isHidden = false
                imgLandmark.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningLandmark.isHidden = true
                imgLandmark.backgroundColor = ColorPrimary
            }
            
            if(txtArea.text == "")
            {
                lblWarningArea.isHidden = false
                imgArea.backgroundColor = UIColor.red
            }
            else
            {
                lblWarningArea.isHidden = true
                imgArea.backgroundColor = ColorPrimary
            }
            
            
        }
        else
        {
            FromVC = 4
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let slideMenuViewController = storyboard.instantiateViewController(withIdentifier: "slideMenuViewController") as! SlideMenuViewController
            self.present(slideMenuViewController, animated: true, completion: nil)
        }
        
        
    }
    @IBAction func btnBackTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        
        return AreasArray["area"].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = AreaTableView.dequeueReusableCell(withIdentifier: "areaTableViewCell", for: indexPath) as! AreaTableViewCell
        
        cell.lblAreaName.text = AreasArray["area"][indexPath.row]["name"].stringValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = AreaTableView.cellForRow(at: indexPath) as! AreaTableViewCell
        
        txtArea.text = cell.lblAreaName.text
        
        if(txtArea.text != "")
        {
            lblWarningArea.isHidden = true
            imgArea.backgroundColor = ColorPrimary
        }
        else
        {
            lblWarningArea.isHidden = false
            imgArea.backgroundColor = UIColor.red
        }
        
        ViewAlpha.isHidden = true
        AreaTableView.isHidden = true
        self.view.endEditing(true)
    }
    
    func parseJSON()
    {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                
                let data = try Data(contentsOf: url)
                AreasArray = try JSON(data: data)
                
                print(self.AreasArray)
                
                
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
    }
    
    @IBAction func AreaEditingBegin(_ sender: UITextField) {
        
        self.view.endEditing(true)
        
        ViewAlpha.isHidden = false
        AreaTableView.isHidden = false
    }
    
    @IBAction func txtEditingValueChanged(_ sender: UITextField) {
        
        if(sender == txtHouseNo)
        {
            if(sender.text != "")
            {
                lblWarningHouseNo.isHidden = true
                imgHouseNo.backgroundColor = ColorPrimary
            }
            else
            {
                lblWarningHouseNo.isHidden = false
                imgHouseNo.backgroundColor = UIColor.red
            }
            
        }
        
        if(sender == txtSociety)
        {
            if(sender.text != "")
            {
                lblWarningSociety.isHidden = true
                imgSociety.backgroundColor = ColorPrimary
            }
            else
            {
                lblWarningSociety.isHidden = false
                imgSociety.backgroundColor = UIColor.red
            }
        }
        
        if(sender == txtLandmark)
        {
            if(sender.text != "")
            {
                lblWarningLandmark.isHidden = true
                imgLandmark.backgroundColor = ColorPrimary
            }
            else
            {
                lblWarningLandmark.isHidden = false
                imgLandmark.backgroundColor = UIColor.red
            }
        }
        
        if(sender == txtArea)
        {
            if(sender.text != "")
            {
                lblWarningArea.isHidden = true
                imgArea.backgroundColor = ColorPrimary
            }
            else
            {
                lblWarningArea.isHidden = false
                imgArea.backgroundColor = UIColor.red
            }
        }
        
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
        
        txtHouseNo.inputAccessoryView = doneToolbar
        txtSociety.inputAccessoryView = doneToolbar
        txtLandmark.inputAccessoryView = doneToolbar
        //txt.inputAccessoryView = doneToolbar
        
    }
    @objc func cancelTextField(){
        self.view.endEditing(true)
        
    }
    
    @IBAction func btnMenuTapped(_ sender: UIButton) {
        
        let slidemenu = self.slideMenuController()
        
        slidemenu?.openLeft()
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
