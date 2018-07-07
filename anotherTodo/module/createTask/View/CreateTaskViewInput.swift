//
//  CreateTaskCreateTaskViewInput.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//
import Foundation
protocol CreateTaskViewInput: class {

    /**
        @author Guillaume
        Setup initial state of the view
    */

    func setupInitialState()
    func getTaskName() -> String
    func getDueDate() -> Date?
    func display(with message: String)
}
