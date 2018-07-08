//
//  TaskListTaskListConfigurator.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import UIKit

class TaskListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? TaskListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: TaskListViewController) {
        let router = TaskListRouter()
        router.viewController = viewController
        router.createTaskRouter = CreateTaskRouter()

        let presenter = TaskListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TaskListInteractor()
        interactor.output = presenter

        let taskService = TaskService()
        taskService.getOutput = interactor
        taskService.deleteOutput = interactor

        presenter.interactor = interactor
        viewController.output = presenter
        interactor.taskService = taskService
    }

}
