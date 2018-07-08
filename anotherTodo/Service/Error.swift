//
// Created by guillaume sabatié on 03/07/2018.
// Copyright (c) 2018 guillaume sabatié. All rights reserved.
//

import Foundation

enum Error {
    enum CreateTask {
        case SaveError
    }
    enum GetTask {
        case CannotFetch
    }
    enum DeleteTask {
        case CannotDelete
    }
}
