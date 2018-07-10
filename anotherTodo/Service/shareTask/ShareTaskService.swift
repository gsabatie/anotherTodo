//
// Created by guillaume sabatié on 10/07/2018.
// Copyright (c) 2018 guillaume sabatié. All rights reserved.
//

import Foundation

class ShareTaskService {
    weak var output: ShareTaskServiceOutput!

    struct Key {
        static let id = "id"
        static let name = "name"
        static let date = "date"
    }
    static let TaskFileExtension = "task"
}

extension ShareTaskService: ShareTaskServiceInput {
    func importTask(from url: URL) {
        guard let fileContent = NSDictionary(contentsOf: url) as? [String: Any],
                let taskName = fileContent[Key.name] as? String,
                let taskDate = fileContent[Key.date] as? Date else {
            output.didFailedImportTask()
            return
        }
        let task = TaskWrapper(name: taskName, dueDate: taskDate)
        output.didSucceedImport(task: task)
    }

    func exportToFileURL(task: TaskWrapper) {

        var fileContent: [String: Any] = [Key.id: task.id, Key.name: task.name, Key.date: task.dueDate]

        guard let path = FileManager.default
                .urls(for: .documentDirectory, in: .userDomainMask).first else {
            output.didFailedExportTakd()
            return
        }

        let fileURL = path.appendingPathComponent("/\(task.id).\(ShareTaskService.TaskFileExtension)")
        (fileContent as NSDictionary).write(to: fileURL, atomically: true)
        output.didSucceedExportTask(as: fileURL)
    }
}