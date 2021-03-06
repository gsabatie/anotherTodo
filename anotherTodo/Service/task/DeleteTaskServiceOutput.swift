//
// Created by guillaume sabatié on 08/07/2018.
// Copyright (c) 2018 guillaume sabatié. All rights reserved.
//

import Foundation
import CoreData

protocol DeleteTaskServiceOutput: class  {
    func deleteTaskDidSucceed(with id:String)
    func deleteTaskDidFailed(with id:String, and error: Error.DeleteTask)
}
