//
//  CreateTaskCreateTaskInteractorOutput.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import Foundation

protocol CreateTaskInteractorOutput: class {
    func saveDidSucceed()
    func saveDidFailed(with error:Error.CreateTask)
}
