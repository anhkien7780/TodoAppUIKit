//
//  Coordinator.swift
//  ToDoApp
//
//  Created by Admin on 6/17/25.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    func start()
}
