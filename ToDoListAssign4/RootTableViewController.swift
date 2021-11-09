//
//  RootTableViewController.swift
//  ToDoListAssign4
//
//  Created by Shirin Mansouri on 2021-11-08.
//

import UIKit

class RootTableViewController: UITableViewController {
    private var myList: [String : Date] = [:]
    private var cellPointSize: CGFloat!
    private var toDoList: ToDoList!
    private static let familyCell = "Cell"
    private static let favoritesCell = "Favorites"
    override func viewDidLoad() {
        super.viewDidLoad()

 
        tableView.reloadData()

        
        myList.updateValue(Date(), forKey: "MyFirstTask")
     myList.updateValue(Date.tomorrow, forKey: "MySecondTask")
         myList.updateValue(Date.dayAfterTomorrow, forKey: "MyThirdTask")
        myList.updateValue(Date.yesterday, forKey: "MyForthTask")
        let preferredTableViewFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        cellPointSize = preferredTableViewFont.pointSize
        tableView.estimatedRowHeight = cellPointSize
   
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
                    let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewController.familyCell, for: indexPath)
                    cell.textLabel?.font = UIFont(name:"FontAwesome",size:15)
                    let index = myList.index(myList.startIndex , offsetBy: indexPath.row)
                    cell.textLabel?.text = myList.keys[index]
                    cell.detailTextLabel?.text =  myList.keys[index]
             return cell
             
       
        
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
