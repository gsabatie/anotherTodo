//
//  TaskListTaskListInteractorOutput.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import Foundation

protocol TaskListInteractorOutput: class {
    func getTaskDidSucceed(fetchedTasks: [TaskWrapper])
    func getTaskDidFailed(error: Error.GetTask)
}
