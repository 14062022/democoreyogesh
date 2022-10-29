//
//  CollegeDetailVC.swift
//  democore
//
//  Created by Kaushal Prajapati on 29/10/22.
//

import UIKit

class CollegeDetailVC: UITableViewController
{
    
    @IBOutlet weak var lblCollageName: UILabel!
    @IBOutlet weak var lblCollageAddress: UILabel!
    @IBOutlet weak var lblCollageCity: UILabel!
    @IBOutlet weak var lblCollageUniversity: UILabel!
    
    var collageDetail : College?
    var indexRow = Int()

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        
            lblCollageName.text = collageDetail?.name ?? ""
            lblCollageCity.text = collageDetail?.city ?? ""
            lblCollageUniversity.text =  collageDetail?.university ?? ""
            lblCollageAddress.text = collageDetail?.address ?? ""
        
    }
    @IBAction func btnEditClick(_ sender: Any)
    {
        let formVC = self.storyboard?.instantiateViewController(withIdentifier: "CollegeFormViewController") as! CollegeFormViewController
        formVC.isUpdate = true
        formVC.collageDetails = collageDetail
        formVC.indexRow = indexRow
        self.navigationController?.pushViewController(formVC, animated: true)
        
    }
    
}
