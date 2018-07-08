//
//  TaskListTaskListInteractor.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

class TaskListInteractor {

    var taskService: TaskService!
    weak var output: TaskListInteractorOutput!

}

extension TaskListInteractor: TaskListInteractorInput {
    func get() {
        taskService.get()
    }
}

extension TaskListInteractor: GetTaskServiceOutput {
    func getTaskDidSucceed(tasks: [TaskWrapper]) {
        output.getTaskDidSucceed(fetchedTasks: tasks)
    }

    func getTaskDidFailed(error: Error.GetTask) {
        output.getTaskDidFailed(error: error)
    }
}