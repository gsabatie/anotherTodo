//
// Created by guillaume sabatié on 08/07/2018.
// Copyright (c) 2018 guillaume sabatié. All rights reserved.
//

import Foundation
import CoreData

protocol DeleteTaskServiceInput {
    func delete(with id: String)
}
