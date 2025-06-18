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
        showToDoList()
    }
    
    func showToDoList(){
        let todoListVC = ToDoListViewController()
        navigationController.viewControllers = [todoListVC]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    
    
    
}
