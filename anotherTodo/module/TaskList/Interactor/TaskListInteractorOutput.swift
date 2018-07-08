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
    func deleteTaskDidSucceed(with index: Int)
    func deleteTaskDidDFailed(with index: Int,  and error: Error.DeleteTask)
}
