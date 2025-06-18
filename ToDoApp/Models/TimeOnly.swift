//
//  TimeOnly.swift
//  ToDoApp
//
//  Created by Admin on 6/17/25.
//

import Foundation

struct TimeOnly{
    var hour: Int
    var minute: Int
}

extension TimeOnly{
    func toString() -> String {
        String(format: "%02d:%02d", hour, minute)
    }
}
