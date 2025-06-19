//
//  AddNewTaskViewController.swift
//  ToDoApp
//
//  Created by Admin on 6/19/25.
//

import Foundation
import UIKit

class AddNewTaskViewController: UIViewController{
    
    let closeIconView = CloseIconView()
    let headerContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "#4A3780")
        view.heightAnchor.constraint(equalToConstant: 96).isActive = true
        return view
    }()
    let headerTitleView: UILabel = {
        let label = UILabel()
        label.text = "Add New Task"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [closeIconView, headerTitleView, headerTitleView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [closeIconView, headerTitleView].forEach{
            headerContainerView.addSubview($0)
        }
        
        view.addSubview(headerContainerView)
        
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            closeIconView.centerYAnchor.constraint(equalTo: headerContainerView.centerYAnchor),
            closeIconView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: 16),
            headerTitleView.centerXAnchor.constraint(equalTo: headerContainerView.centerXAnchor),
            headerTitleView.centerYAnchor.constraint(equalTo: headerContainerView.centerYAnchor)
        ])
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
