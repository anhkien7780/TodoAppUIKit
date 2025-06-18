//
//  ToDoListViewController.swift
//  ToDoApp
//
//  Created by Admin on 6/17/25.
//

import Foundation
import UIKit

class ToDoListViewController: UIViewController {
    
    private var viewModel: ToDoListViewModel
    
    private let uncompletedItemStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = UIColor(hex: "E5E9ED")
        stack.spacing = 1
        stack.layer.cornerRadius = 16
        stack.clipsToBounds = true
        return stack
    }()
    
    init(){
        let sampleItems = [
            TodoItemDetail(taskTitle: "Study lesson", category: .Task, isCompleted: false),
            TodoItemDetail(taskTitle: "Run 5k", category: .Goal, time: TimeOnly(hour: 4, minute: 0), isCompleted: false),
            TodoItemDetail(taskTitle: "Go to party", category: .Event, time: TimeOnly(hour: 4, minute: 0), isCompleted: false)
        ]
        self.viewModel = ToDoListViewModel(items: sampleItems)
        super.init(nibName: nil, bundle: nil)
        self.viewModel.onDataChanged = {
            [weak self] in
            self?.reloadUI()
        }
    }
    
    private func reloadUI() {
        uncompletedItemStack.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        for item in viewModel.unCompletedItemList() {
            let todoItemView = TodoItemView(
                item: item
            ){
                [weak self] isCompleted in
                self?.viewModel.toggleCompletion(for: item)
            }
            uncompletedItemStack.addArrangedSubview(todoItemView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadUI()
        view.backgroundColor = UIColor(hex: "#F1F5F9")
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        formatter.locale = Locale(identifier: "en_US")
        
        let dateString = formatter.string(from: Date())
        let headerView = HeaderView(dateString: dateString)
        
        [headerView, uncompletedItemStack].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 222),
            uncompletedItemStack.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -60),
            uncompletedItemStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            uncompletedItemStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
