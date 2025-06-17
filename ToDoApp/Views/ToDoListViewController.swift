//
//  ToDoListViewController.swift
//  ToDoApp
//
//  Created by Admin on 6/17/25.
//

import Foundation
import UIKit

class ToDoListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        formatter.locale = Locale(identifier: "en_US")
        
        let dateString = formatter.string(from: Date())
        print(dateString)
    }
}
