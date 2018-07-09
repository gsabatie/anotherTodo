//
//  TaskListTaskListInteractor.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import CoreData

class TaskListInteractor {
    var taskService: TaskService!
    weak var output: TaskListInteractorOutput!

    var tasks = [TaskWrapper]()
}

extension TaskListInteractor: TaskListInteractorInput {
    func get() {
        taskService.get()
    }

    func deleteTask(at index: Int) {
        taskService.delete(with: tasks[index].id)
    }
}

extension TaskListInteractor: GetTaskServiceOutput {
    func getTaskDidSucceed(tasks: [TaskWrapper]) {
        self.tasks = tasks
        output.getTaskDidSucceed(fetchedTasks: tasks)
    }

    func getTaskDidFailed(error: Error.GetTask) {
        output.getTaskDidFailed(error: error)
    }
}

extension TaskListInteractor: DeleteTaskServiceOutput {

    private func indexForTask(with id: String) -> Int? {
        return tasks.index { (task) -> Bool in
            task.id == id
        }
    }

    func deleteTaskDidSucceed(with id: String) {
        guard let index = indexForTask(with: id) else {
            deleteTaskDidFailed(with: id, and: Error.DeleteTask.CannotDelete)
            return
        }
        output.deleteTaskDidSucceed(with: index)
    }

    func deleteTaskDidFailed(with id: String, and error: Error.DeleteTask) {
        guard let index = indexForTask(with: id) else {
            return
        }
        output.deleteTaskDidDFailed(with: index, and: Error.DeleteTask.CannotDelete)
    }


}