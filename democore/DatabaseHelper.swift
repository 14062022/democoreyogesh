//
//  File.swift
//  democore
//
//  Created by Kaushal Prajapati on 28/10/22.
//

import Foundation
import CoreData
import UIKit

class databaseHelper : NSObject
{
    static var shareInstance = databaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func saveCollegeData(collegeDict: [String:String])
    {
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context!) as! College
        college.name = collegeDict["collegeName"]
        college.address = collegeDict["collegeAddress"]
        college.city = collegeDict["collegeCity"]
        college.university = collegeDict["collegeUniversity"]
        
        do {
            try context?.save()
        }
        catch let err {
            print("data not saved..\(err.localizedDescription)")
        }
    }
    
    func getAllCollegeData() -> [College]
    {
        var arrCollege = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do{
            arrCollege = try context?.fetch(fetchRequest) as! [College]
        }
        catch let err{
            print("error in fetching..\(err.localizedDescription)")
        }
        return arrCollege
    }
    func deleteCollegeData(index:Int) ->[College]
    {
        var collegeData = self.getAllCollegeData()
        context?.delete(collegeData[index])
        collegeData.remove(at: index)
        do{
            try context?.save()
        }
        catch let err{
            print("delete college data:..\(err.localizedDescription)")
        }
        return collegeData
    }
    
    func editCollageData(collegeDict: [String:String], index:Int)
    {
        var college = self.getAllCollegeData()
        college[index].name = collegeDict["collegeName"]
        college[index].address = collegeDict["collegeAddress"]
        college[index].city = collegeDict["collegeCity"]
        college[index].university = collegeDict["collegeUniversity"]
        do {
            try context?.save()
        }
        catch let err {
            print("data not saved..\(err.localizedDescription)")
        }
    }
}
