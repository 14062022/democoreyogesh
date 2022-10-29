//
//  CollegeList.swift
//  democore
//
//  Created by Kaushal Prajapati on 29/10/22.
//

import UIKit

class CollegeList: UIViewController
{
    var arrCollege = [College]()

    @IBOutlet weak var tblCollegeList: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.arrCollege = databaseHelper.shareInstance.getAllCollegeData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.arrCollege = databaseHelper.shareInstance.getAllCollegeData()
        self.tblCollegeList.reloadData()
    }
    @IBAction func btnAddCollege(_ sender: UIButton) {
        let collegeForm = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        self.navigationController?.pushViewController(collegeForm, animated: true)
    }
}
extension CollegeList : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCollege.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeListViewCell", for: indexPath) as! CollegeListViewCell
        cell.college = arrCollege[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collegeDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeDetailVC") as! CollegeDetailVC
        collegeDetailVC.collageDetail = arrCollege[indexPath.row]
        collegeDetailVC.indexRow = indexPath.row
        self.navigationController?.pushViewController(collegeDetailVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrCollege = databaseHelper.shareInstance.deleteCollegeData(index: indexPath.row)
            self.tblCollegeList.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

