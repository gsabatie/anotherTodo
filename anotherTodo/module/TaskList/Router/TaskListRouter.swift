//
//  TaskListTaskListRouter.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//
import UIKit

class TaskListRouter {
    var createTaskRouter: CreateTaskRouter!

    var viewController: TaskListViewController!
}

extension TaskListRouter: TaskListRouterInput {
    func presentTaskListModule(fromViewController viewController: UIViewController) {}

    func presentCreateTaskModule() {
        createTaskRouter.presentCreateTaskModule(fromViewController: viewController)
    }
}