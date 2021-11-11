//
//  ToDoList.swift
//  ToDoListAssign4
//
//  Created by Shirin Mansouri on 2021-11-08.
//

import Foundation
import UIKit
class ToDoList
{
    static let sharedToDoList = ToDoList()
    private(set) var myToDoListDate: [String: Date] = [:]
    private(set) var myToDoListStatus: [String: Int] = [:]
    init()
    {
        let defaults = UserDefaults.standard
        let storedListDate = defaults.object(forKey: "ToDoListDate") as? [String: Date]
        let storedListStatus = defaults.object(forKey: "ToDoListStatus") as? [String: Int]
        myToDoListDate = storedListDate != nil ? storedListDate! : [:]
        myToDoListStatus = storedListStatus != nil ? storedListStatus! : [:]
        
    }
    func addToList(newItemName: String , dueDate : Date , status : Int) {
        if !myToDoListDate.keys.contains(newItemName) {
            myToDoListDate.updateValue(dueDate, forKey: newItemName)
            myToDoListStatus.updateValue(status, forKey: newItemName)
            }
        }
        
    func removeFromList(itemName: String) {
      if let index = myToDoListDate.keys.firstIndex(of: itemName)
           {
                myToDoListDate.remove(at: index)
                let indexStatus = myToDoListStatus.keys.firstIndex(of: itemName)
                myToDoListStatus.remove(at: indexStatus!)
                saveList()
            }
        }
        
    private func saveList() {
            let defaults = UserDefaults.standard
            defaults.set(myToDoListDate, forKey: "ToDoListDate")
            defaults.set(myToDoListDate, forKey: "ToDoListStatus")
            defaults.synchronize()
        }
}
