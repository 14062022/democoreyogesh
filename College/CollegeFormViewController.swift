//
//  ViewController.swift
//  democore
//
//  Created by Kaushal Prajapati on 28/10/22.
//

import UIKit
import CloudKit
import CoreData

class CollegeFormViewController: UIViewController {

    var arrCollege = [College]()
    
// MARK: outlets
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtUniversity: UITextField!
    
    var isUpdate = false
    var indexRow = Int()
    var collegeDetail: College?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtName.text = collegeDetail?.name
        self.txtCity.text = collegeDetail?.city
        self.txtAddress.text = collegeDetail?.address
        self.txtUniversity.text = collegeDetail?.university
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isUpdate {
            btnSave.setTitle("Update", for: .normal)
        }
        else
        {
            btnSave.setTitle("Save", for: .normal)
        }
    }
    
    @IBAction func btnSaveForm(_ sender: Any)
    {
        
    }
}

//MARK: Extensions
extension CollegeFormViewController
{
    @IBAction func btnSave(_ sender: UIButton)
    {
        //var dict = ["name":txtName.text,"address":txtAddress.text,"city":txtCity.text,"mobile":txtMobile.text]
        //databaseHelper.shareInstance.saveCollegeData(collegeDict: dict as! [String:String])
        self.collegeSaveData()
        self.navigationController?.popViewController(animated: true)
    }
}

extension CollegeFormViewController
{
    func collegeSaveData(){
        guard let collegeName = txtName.text else {return}
        guard let collegeAddress = txtAddress.text else {return}
        guard let collegeCity = txtCity.text else {return}
        guard let collegeUniversity = txtUniversity.text else {return}
        
        let colleceDict = [
            "collegeName":collegeName,
            "collegeAddress":collegeAddress,
            "collegeCity":collegeCity,
            "collegeUniversity":collegeUniversity
        ]
        
        if isUpdate{
            databaseHelper.shareInstance.editCollageData(collegeDict: colleceDict, index: indexRow)
            isUpdate = false
        }
        else {
            databaseHelper.shareInstance.saveCollegeData(collegeDict: colleceDict)
        }
    }
}

