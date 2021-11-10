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
    private(set) var myToDoList: [String: [Date : Int]] = [:]
    init()
    {
        let defaults = UserDefaults.standard
        let storedList = defaults.object(forKey: "ToDoList") as? [String:[Date : Int]]
        myToDoList = storedList != nil ? storedList! : [:]
        
    }
    func addToList(newItemName: String , dueDate : Date , status : Int) {
        if !myToDoList.keys.contains(newItemName) {
            myToDoList.updateValue([dueDate : status], forKey: newItemName)
         
            }
        }
        
        func removeFromList(itemName: String) {
            if let index = myToDoList.keys.firstIndex(of: itemName) {
                myToDoList.remove(at: index)
                saveList()
            }
        }
        
        private func saveList() {
            let defaults = UserDefaults.standard
            defaults.set(myToDoList, forKey: "ToDoList")
            defaults.synchronize()
        }
}
