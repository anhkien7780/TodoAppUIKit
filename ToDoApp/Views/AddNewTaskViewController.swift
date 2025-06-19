//
//  AddNewTaskViewController.swift
//  ToDoApp
//
//  Created by Admin on 6/19/25.
//

import Foundation
import UIKit

class AddNewTaskViewController: UIViewController{
    
    let headerView = AddNewTaskHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

