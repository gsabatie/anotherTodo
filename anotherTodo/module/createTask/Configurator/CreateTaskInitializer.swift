//
//  CreateTaskCreateTaskInitializer.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import UIKit

class CreateTaskModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var createtaskViewController: CreateTaskViewController!

    override func awakeFromNib() {

        let configurator = CreateTaskModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: createtaskViewController)
    }

}
