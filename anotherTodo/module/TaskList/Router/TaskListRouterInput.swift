//
//  TaskListTaskListRouterInput.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import Foundation
import UIKit
protocol TaskListRouterInput {
    func presentTaskListModule(fromViewController viewController: UIViewController)

    func presentCreateTaskModule()
}
