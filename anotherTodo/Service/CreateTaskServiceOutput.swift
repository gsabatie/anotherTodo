//
// Created by guillaume sabatié on 03/07/2018.
// Copyright (c) 2018 guillaume sabatié. All rights reserved.
//

import Foundation

protocol CreateTaskServiceOutput {
    func createTaskDidSucceed()
    func createTaskDidFailed(error: Error.CreateTask)

}