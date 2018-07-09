//
// Created by guillaume sabatié on 07/07/2018.
// Copyright (c) 2018 guillaume sabatié. All rights reserved.
//

import Foundation

protocol GetTaskServiceOutput: class {
    func getTaskDidSucceed(tasks: [TaskWrapper])
    func getTaskDidFailed(error: Error.GetTask)
}