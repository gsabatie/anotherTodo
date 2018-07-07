//
//  CreateTaskCreateTaskViewOutput.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

protocol CreateTaskViewOutput {

    /**
        @author Guillaume
        Notify presenter that view is ready
    */

    func viewIsReady()
    func createButtonDidTouch()
}
