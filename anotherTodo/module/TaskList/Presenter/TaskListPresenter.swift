//
//  TaskListTaskListPresenter.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import UIKit

class TaskListPresenter {

    weak var view: TaskListViewInput!
    var interactor: TaskListInteractorInput!
    var router: TaskListRouterInput!

    var taskToDisplay = [TaskWrapper]()

}

extension TaskListPresenter: TaskListModuleInput {

}

extension TaskListPresenter: TaskListViewOutput {
    func addButtonDidTouched() {
        router.presentCreateTaskModule()
    }

    func viewIsReady() {

    }

    func deleteTaskButtonTouched(at index: IndexPath) {
        interactor.deleteTask(at: index.row)
    }

    func viewWillAppear() {
        interactor.get()
    }
}

extension TaskListPresenter: TaskListInteractorOutput {
    func getTaskDidSucceed(fetchedTasks: [TaskWrapper]) {
        view.display(tasks: fetchedTasks)
    }

    func getTaskDidFailed(error: Error.GetTask) {
        view.display(message: "error")
    }

    func deleteTaskDidSucceed(with index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        view.removeRow(at: indexPath)
    }

    func deleteTaskDidDFailed(with index: Int, and error: Error.DeleteTask) {
        view.display(message: "The task \(taskToDisplay[index].name) cannot be deleted")
    }

    func deleteTaskDidDFailed(with index: Int) {
        view.display(message: "This task cannot be deleted")
    }
}