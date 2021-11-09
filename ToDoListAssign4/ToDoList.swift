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
    private(set) var myToDoList: [String: Date] = [:]
    init()
    {
        let defaults = UserDefaults.standard
        let storedList = defaults.object(forKey: "ToDoList") as? [String:Date]
        myToDoList = storedList != nil ? storedList! : [:]
        
    }
    func addToList(newItemName: String , dueDate : Date) {
        if !myToDoList.keys.contains(newItemName) {
            myToDoList.updateValue(dueDate, forKey: newItemName)
            saveList()
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
