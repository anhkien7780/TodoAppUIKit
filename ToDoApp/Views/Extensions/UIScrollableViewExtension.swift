//
//  UIScrollableViewExtension.swift
//  ToDoApp
//
//  Created by Admin on 6/19/25.
//

import Foundation
import UIKit

extension ToDoListViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        scrollView.bounces = targetContentOffset.pointee.y > 0
    }
}
