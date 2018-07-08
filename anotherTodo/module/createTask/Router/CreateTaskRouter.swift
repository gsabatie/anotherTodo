//
//  CreateTaskCreateTaskRouter.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//
import UIKit

class CreateTaskRouter {
    static let CreateTaskViewIdentifier = "CreateTaskViewController"

    var viewController: CreateTaskViewController!

    private func createTaskViewControllerFromStoryboard() -> CreateTaskViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: CreateTaskRouter.CreateTaskViewIdentifier) as! CreateTaskViewController
        return viewController
    }
}

extension CreateTaskRouter: CreateTaskRouterInput {
    func presentCreateTaskModule(fromViewController viewController: UIViewController) {
        viewController.navigationController?.pushViewController(createTaskViewControllerFromStoryboard(), animated: true)
    }

    func presentParentViewController() {
        viewController.navigationController?.popViewController(animated: true)
    }
}