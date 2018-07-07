//
// Created by guillaume sabatié on 03/07/2018.
// Copyright (c) 2018 guillaume sabatié. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct TaskWrapper {
    var name: String
    var dueDate: Date
}

class TaskService {
    var output: CreateTaskServiceOutput!

    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }




}

extension TaskService: CreateTaskServiceInput {
    func create(task: TaskWrapper) {
        let managedContext = self.appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext)!

        let taskDB = NSManagedObject(entity: entity, insertInto: managedContext)

        taskDB.setValue(task.name, forKeyPath: "name")
        taskDB.setValue(task.dueDate, forKeyPath: "dueDate")

        do {
            try managedContext.save()
            output.createTaskDidSucceed()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            output.createTaskDidFailed(error: Error.CreateTask.SaveError)
        }
    }
}