//
// Created by guillaume sabatié on 10/07/2018.
// Copyright (c) 2018 guillaume sabatié. All rights reserved.
//

import Foundation

protocol ShareTaskServiceOutput: class {
    func didSucceedExportTask(as url: URL)
    func didFailedExportTakd()

    func didSucceedImport(task: TaskWrapper)
    func didFailedImportTask()
}
