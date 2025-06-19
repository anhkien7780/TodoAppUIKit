//
//  AppCoordinator.swift
//  ToDoApp
//
//  Created by Admin on 6/17/25.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow?) {
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
//        showToDoList()
        // For test only
        showAddNewTask()
    }
    
    func showToDoList(){
        let todoListVC = ToDoListViewController()
        navigationController.viewControllers = [todoListVC]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    // For test only
    func showAddNewTask(){
        let addNewTaskVC = AddNewTaskViewController()
        navigationController.viewControllers = [addNewTaskVC]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    
    
    
}
