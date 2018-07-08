//
//  CreateTaskCreateTaskRouterInput.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import Foundation
import UIKit

protocol CreateTaskRouterInput {
    func presentCreateTaskModule(fromViewController viewController: UIViewController)
    func presentParentViewController()
}
