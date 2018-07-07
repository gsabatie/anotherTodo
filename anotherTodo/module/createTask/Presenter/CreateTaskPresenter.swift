//
//  CreateTaskCreateTaskPresenter.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

class CreateTaskPresenter {

    weak var view: CreateTaskViewInput!
    var interactor: CreateTaskInteractorInput!
    var router: CreateTaskRouterInput!


}

extension CreateTaskPresenter: CreateTaskModuleInput {

}

extension CreateTaskPresenter: CreateTaskViewOutput {
    func viewIsReady() {

    }

    func createButtonDidTouch() {
        guard let dueDate = view.getDueDate() else {
            view.display(with: ERROR_MESSAGE.WRONG_DATE)
            return
        }
        let taskName = view.getTaskName()
        guard !taskName.isEmpty else {
            view.display(with: ERROR_MESSAGE.EMPTY_TASK)
            return
        }
        let task = TaskWrapper(name: taskName, dueDate: dueDate)
        interactor.save(task: task)
    }
}

extension CreateTaskPresenter: CreateTaskInteractorOutput {
    func saveDidSucceed() {
        view.display(with: "success")
    }

    func saveDidFailed(with error: Error.CreateTask) {
        view.display(with: ERROR_MESSAGE.CANNOT_SAVE)

    }
}

