//
//  StudentListViewController.swift
//  democore
//
//  Created by Kaushal Prajapati on 10/11/22.
//

import UIKit

class StudentListViewController: UIViewController {

    @IBOutlet weak var tableStudentList: UITableView!
    var studentArr = [Student]()
    var college:College?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableStudentList.register(UITableViewCell.self, forCellReuseIdentifier: "studentCell")

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if college?.students?.allObjects != nil {
            studentArr = college?.students?.allObjects as! [Student]
        }
       //studentArr = databaseHelper.shareInstance.getAllStudentData()
        self.tableStudentList.reloadData()
    }
    @IBAction func studentPlusTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let studentFormVC = storyboard.instantiateViewController(withIdentifier: "StudentFormViewController") as! StudentFormViewController
        studentFormVC.college = college
        navigationController?.pushViewController(studentFormVC, animated: true)
    }
}

extension StudentListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArr.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        if cell != nil {
            cell = UITableViewCell(style: .value2, reuseIdentifier: "studentCell")
        }
        cell.textLabel?.text = studentArr[indexPath.row].name
        cell.detailTextLabel?.text = studentArr[indexPath.row].phone
        
        
        return cell
    }
}
