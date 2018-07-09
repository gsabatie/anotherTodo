//
//  CreateTaskCreateTaskInteractor.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

class CreateTaskInteractor {

    weak var output: CreateTaskInteractorOutput!
    var createTaskService: CreateTaskServiceInput!
    var notificationService: NotificationServiceInput!


}

extension CreateTaskInteractor: CreateTaskInteractorInput {

    func save(task: TaskWrapper) {
        createTaskService.create(task: task)
    }
}

extension CreateTaskInteractor: CreateTaskServiceOutput {
    func createTaskDidSucceed(createdTask: TaskWrapper) {

        notificationService.create(with: "the task \(createdTask.name) is overdue",
                                   title: "Task overdue",
                                   categoryIdentifier: NotificationService.CategoryIdentifier.task,
                                   fireDate: createdTask.dueDate,
                                   id: createdTask.id)
        output.saveDidSucceed()
    }


    func createTaskDidFailed(error: Error.CreateTask) {
        output.saveDidFailed(with: error)
    }
}

