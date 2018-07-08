//
//  TaskListTaskListViewOutput.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

protocol TaskListViewOutput {

    /**
        @author Guillaume
        Notify presenter that view is ready
    */

    func viewIsReady()
    func viewWillAppear()
    func addButtonDidTouched()
}
