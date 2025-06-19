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
    let bodyStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        
        return stack
    }()
    let taskTextFiledView = CustomTextFieldView(
        labelText: "Task Title", 
        placeholder: "Task Title",
        textFieldHeight: 56
    )
    let categoryStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 24
        stack.axis = .horizontal
        return stack
    }()
    let categoryLabelView: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let categoryButtonStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 16
        stack.axis = .horizontal
        return stack
    }()
    let taskButton = CategoryButtonView(category: .Task)
    let evenButton = CategoryButtonView(category: .Event)
    let goalButton = CategoryButtonView(category: .Goal)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F1F5F9")
        setTranslatesAutoresizingMaskIntoConstraints()
        
        [taskButton, evenButton, goalButton].forEach{
            categoryButtonStackView.addArrangedSubview($0)
        }
        [categoryLabelView, categoryButtonStackView].forEach{
            categoryStackView.addArrangedSubview($0)
        }
        [taskTextFiledView, categoryStackView].forEach{
            bodyStackView.addArrangedSubview($0)
        }
        
        view.addSubview(headerView)
        view.addSubview(bodyStackView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bodyStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            bodyStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bodyStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    private func setTranslatesAutoresizingMaskIntoConstraints(){
        [headerView,
         bodyStackView,
         taskTextFiledView,
         categoryStackView,
         categoryLabelView,
         categoryButtonStackView,
         taskButton,
         evenButton,
         goalButton].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}

