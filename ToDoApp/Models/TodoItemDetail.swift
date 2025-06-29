//
//  TodoItem.swift
//  ToDoApp
//
//  Created by Admin on 6/17/25.
//

import Foundation

struct TodoItemDetail {
    var id: UUID = UUID()
    var taskTitle: String
    var category: Category?
    var date: String?
    var time: String?
    var isCompleted: Bool
    var note: String?
}
