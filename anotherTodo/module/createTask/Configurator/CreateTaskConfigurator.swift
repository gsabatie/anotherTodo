//
//  CreateTaskCreateTaskConfigurator.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import UIKit

class CreateTaskModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CreateTaskViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CreateTaskViewController) {

        let taskService = TaskService()
        let router = CreateTaskRouter()

        let presenter = CreateTaskPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CreateTaskInteractor()
        interactor.output = presenter
        interactor.createTaskService = taskService

        presenter.interactor = interactor
        viewController.output = presenter
        taskService.output = interactor
    }

}
