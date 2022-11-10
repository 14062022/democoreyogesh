//
//  StudentFormViewController.swift
//  democore
//
//  Created by Kaushal Prajapati on 10/11/22.
//

import UIKit

class StudentFormViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    var college:College?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func btnAddStudentPress(_ sender: Any)
    {
        guard let name = txtName.text else {return}
        guard let email = txtemail.text else {return}
        guard let phone = txtMobile.text else {return}
        guard let mainCollege = college  else {return}
            
        var studentDict = ["Sname": name, "Semail": email, "Sphone": phone]
        databaseHelper.shareInstance.saveStudentData(studentDict: studentDict, college: mainCollege)
    }
    
}
