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
    
    @IBOutlet var imgHouseNo: UIImageView!
    @IBOutlet var imgSociety: UIImageView!
    @IBOutlet var imgLandmark: UIImageView!
    @IBOutlet var imgArea: UIImageView!
    
    @IBOutlet var lblWarningHouseNo: UILabel!
    @IBOutlet var lblWarningSociety: UILabel!
    @IBOutlet var lblWarningLandmark: UILabel!
    @IBOutlet var lblWarningArea: UILabel!
    
    
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

        // Do any additional setup after loading the view.
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
        ViewAlpha.isHidden = true
        AreaTableView.isHidden = true
        
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
