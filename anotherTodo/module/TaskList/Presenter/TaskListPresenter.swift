//
//  TaskListTaskListPresenter.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

class TaskListPresenter{

    weak var view: TaskListViewInput!
    var interactor: TaskListInteractorInput!
    var router: TaskListRouterInput!

}

extension TaskListPresenter:TaskListModuleInput {

}
extension TaskListPresenter: TaskListViewOutput {
    func addButtonDidTouched() {
        router.presentCreateTaskModule()
    }

    func viewIsReady() {

    }

    func viewWillAppear() {
        interactor.get()
    }
}
extension TaskListPresenter: TaskListInteractorOutput{
    func getTaskDidSucceed(fetchedTasks: [TaskWrapper]) {
        view.display(tasks: fetchedTasks)
    }

    func getTaskDidFailed(error: Error.GetTask) {
        view.display(message: "error")
    }
}