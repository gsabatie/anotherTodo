//
//  TaskListTaskListViewInput.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//
import UIKit

protocol TaskListViewInput: class {

    /**
        @author Guillaume
        Setup initial state of the view
    */

    func setupInitialState()
    func display(tasks: [TaskWrapper])
    func display(message: String)
    func removeRow(at indexPath:IndexPath)
}
