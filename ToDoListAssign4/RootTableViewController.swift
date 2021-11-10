//
//  RootTableViewController.swift
//  ToDoListAssign4
//
//  Created by Shirin Mansouri on 2021-11-08.
//

import UIKit
import Foundation

class RootTableViewController: UITableViewController {
    private var myList: [String : [Date : Int]] = [:]
    private var cellPointSize: CGFloat!
    private var toDoList: ToDoList!
    private static let TaskCell = "Cell"
    private static let DetailCell = "CellDetail"
    override func viewDidLoad() {
        super.viewDidLoad()

 
        tableView.reloadData()

        toDoList = ToDoList()
   
        toDoList.addToList(newItemName: "MyFirstTask", dueDate: Date() , status: 0)
        toDoList.addToList(newItemName: "MySecondTask", dueDate: Date.tomorrow , status: 1)
        toDoList.addToList(newItemName: "MyThirdTask", dueDate: Date.dayAfterTomorrow  , status: 1)
        toDoList.addToList(newItemName: "MyForthTask", dueDate: Date.yesterday  , status: 1)
        toDoList.addToList(newItemName: "MyFifthTask", dueDate:Date.dayBeforeYesterday , status: 1)
        toDoList.addToList(newItemName: "MySixthTask", dueDate: Date()  , status: 0)
        toDoList.addToList(newItemName: "MySeventhTask", dueDate: Date.tomorrow  , status: 1)
        
        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        cellPointSize = preferredTableViewFont.pointSize
        tableView.estimatedRowHeight = cellPointSize
        myList  = toDoList.myToDoList
   
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? myList.count : 1
       
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                    // The to do list names
        let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewController.TaskCell, for: indexPath)

                    cell.textLabel?.font = UIFont(name:"FontAwesome",size:15)
                    let index = myList.index(myList.startIndex , offsetBy: indexPath.row)
                    cell.textLabel?.text = myList.keys[index]
                    cell.detailTextLabel?.text =  getTaskStatus(taskKey: myList.keys[index])
                    
             return cell
             
       
        
    }
    private func getTaskStatus(taskKey : String) -> String
    {
        let result : [Date : Int]? = myList[taskKey]
        for item in result!.keys {
            if (result?[item] == 0)
            {
                return "Completed"
                
            }
            else
            {
                if (item < Date())
                {
                    return "OverDue"
                }
                else
                {
                    let dateString = "\(item)"
                    let index = dateString.index(dateString.startIndex, offsetBy: 16)
                    return   String(dateString.prefix(upTo: index))
                }
               
                
            }
          
        }
        return ""
    }
 
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
