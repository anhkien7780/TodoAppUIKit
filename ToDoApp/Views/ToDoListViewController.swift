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
    
    private var completedHeader: UILabel = {
        let label = UILabel()
        label.text = "Completed"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let completedItemStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = UIColor(hex: "E5E9ED")
        stack.spacing = 1
        stack.layer.cornerRadius = 16
        stack.clipsToBounds = true
        return stack
    }()
    
    private let addNewTodoItemButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add New Task", for: .normal)
        button.backgroundColor = UIColor(hex: "#4A3780")
        button.layer.cornerRadius = 28
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    init(){
        let sampleItems = [
            TodoItemDetail(taskTitle: "Study lesson", category: .Task, isCompleted: false),
            TodoItemDetail(taskTitle: "Run 5k", category: .Goal, time: TimeOnly(hour: 4, minute: 0), isCompleted: false),
            TodoItemDetail(taskTitle: "Go to party", category: .Event, time: TimeOnly(hour: 10, minute: 0), isCompleted: false),
            TodoItemDetail(taskTitle: "Game meetup", category: .Event, time: TimeOnly(hour: 1, minute: 0), isCompleted: true),
            TodoItemDetail(taskTitle: "Go to party", category: .Task, isCompleted: true),
            TodoItemDetail(taskTitle: "Go to party", category: .Task, isCompleted: true),
            TodoItemDetail(taskTitle: "Go to party", category: .Task, isCompleted: true),
            TodoItemDetail(taskTitle: "Go to party", category: .Task, isCompleted: true),
            TodoItemDetail(taskTitle: "Go to party", category: .Task, isCompleted: true),
            TodoItemDetail(taskTitle: "Go to party", category: .Task, isCompleted: true),
            TodoItemDetail(taskTitle: "Go to party", category: .Task, isCompleted: true),
            TodoItemDetail(taskTitle: "Go to party", category: .Task, isCompleted: true),
            TodoItemDetail(taskTitle: "Go to party", category: .Task, isCompleted: true),
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
        
        completedItemStack.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        for item in viewModel.unCompletedItemList() {
            let todoItemView = TodoItemView(item: item){
                [weak self] isCompleted in
                self?.viewModel.toggleCompletion(for: item)
            }
            uncompletedItemStack.addArrangedSubview(todoItemView)
        }
        
        for item in viewModel.completedItemList() {
            let todoItemView = TodoItemView(item: item){
                [weak self] isUncompleted in
                self?.viewModel.toggleCompletion(for: item)
            }
            completedItemStack.addArrangedSubview(todoItemView)
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
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollableList = UIScrollView()
        scrollableList.translatesAutoresizingMaskIntoConstraints = false
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollableList.addSubview(contentView)
        
        contentView.addSubview(headerView)
        
        [uncompletedItemStack, completedHeader, completedItemStack].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
                
        view.addSubview(scrollableList)
        view.addSubview(addNewTodoItemButton)
        scrollableList.translatesAutoresizingMaskIntoConstraints = false
        addNewTodoItemButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //Scrollable View
            scrollableList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollableList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollableList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollableList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // Content View
            contentView.topAnchor.constraint(equalTo: scrollableList.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollableList.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollableList.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollableList.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollableList.frameLayoutGuide.widthAnchor),
            
            
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 222),
            
            uncompletedItemStack.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -60),
            uncompletedItemStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            uncompletedItemStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            completedHeader.topAnchor.constraint(equalTo: uncompletedItemStack.bottomAnchor, constant: 24),
            completedHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            completedHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            completedItemStack.topAnchor.constraint(equalTo: completedHeader.bottomAnchor, constant: 24),
            completedItemStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            completedItemStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            completedItemStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            addNewTodoItemButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            addNewTodoItemButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addNewTodoItemButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
        ])
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
