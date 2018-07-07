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


}

extension CreateTaskInteractor: CreateTaskInteractorInput {

    func save(task: TaskWrapper) {
        createTaskService.create(task: task)
    }
}

extension CreateTaskInteractor: CreateTaskServiceOutput {
    func createTaskDidSucceed() {
        output.saveDidSucceed()
    }

    func createTaskDidFailed(error: Error.CreateTask) {
        output.saveDidFailed(with: error)
    }
}

