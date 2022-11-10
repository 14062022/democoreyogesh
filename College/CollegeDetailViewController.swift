//
//  CollegeDetailVC.swift
//  democore
//
//  Created by Kaushal Prajapati on 29/10/22.
//

import UIKit

class CollegeDetailViewController: UITableViewController
{
    
    @IBOutlet weak var lblCollageName: UILabel!
    @IBOutlet weak var lblCollageAddress: UILabel!
    @IBOutlet weak var lblCollageCity: UILabel!
    @IBOutlet weak var lblCollageUniversity: UILabel!
    @IBOutlet weak var lblStudent: UILabel!
    var collegeDetail : College?
    
    var indexRow = Int()

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        
            lblCollageName.text = collegeDetail?.name ?? ""
            lblCollageCity.text = collegeDetail?.city ?? ""
            lblCollageUniversity.text =  collegeDetail?.university ?? ""
            lblCollageAddress.text = collegeDetail?.address ?? ""
        if let stu = collegeDetail?.students?.allObjects as? [Student] {
            lblStudent.text = "\(stu.count)"
        }else {
            lblStudent.text = "0"
        }
        
    }
    @IBAction func btnEditClick(_ sender: Any)
    {
        let formVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        formVC.isUpdate = true
        formVC.collegeDetail = collegeDetail
        formVC.indexRow = indexRow
        self.navigationController?.pushViewController(formVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row ==  4 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let studentListVC = storyboard.instantiateViewController(withIdentifier: "StudentListViewController") as! StudentListViewController
            studentListVC.college = collegeDetail
            navigationController?.pushViewController(studentListVC, animated: true)
        }
    }
    
}
