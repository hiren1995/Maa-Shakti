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
    
    @IBOutlet var txtDOB: UITextField!
    var datePickerView  : UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //CalenderView.delegate = self
        //CalenderView.dataSource = self
        
        //CalenderView.isHidden = true
        
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
        
        var dateFormatter = DateFormatter()
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
