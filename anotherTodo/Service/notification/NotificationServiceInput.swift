//
// Created by guillaume sabatié on 09/07/2018.
// Copyright (c) 2018 guillaume sabatié. All rights reserved.
//

import Foundation

protocol NotificationServiceInput {
    func create(with body: String, title: String, categoryIdentifier: String, fireDate: Date, id: String)
}
