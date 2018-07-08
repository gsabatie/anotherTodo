//
//  TaskListTaskListInitializer.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import UIKit

class TaskListModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var tasklistViewController: TaskListViewController!

    override func awakeFromNib() {

        let configurator = TaskListModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: tasklistViewController)
    }

}
