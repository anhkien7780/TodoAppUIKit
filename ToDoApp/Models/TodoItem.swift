//
//  TodoItem.swift
//  ToDoApp
//
//  Created by Admin on 6/17/25.
//

import Foundation

class TodoItem {
    var taskTitle: String
    var category: Category?
    var date: Date
    var time: TimeOnly
    
    init(taskTitle: String, category: Category? = nil, date: Date, time: TimeOnly) {
        self.taskTitle = taskTitle
        self.category = category
        self.date = date
        self.time = time
    }
}
