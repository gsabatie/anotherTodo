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
    var id: String

    init(managedObject: NSManagedObject) {
        self.name = ""
        self.id = ""
        self.dueDate = Date()
        if let name = managedObject.value(forKey: TaskService.PropertyKeyPath.Name) as? String,
           let dueDate = managedObject.value(forKey: TaskService.PropertyKeyPath.DueDate) as? Date {
            self.name = name
            self.dueDate = dueDate
            if !managedObject.objectID.isTemporaryID {
                self.id = managedObject.objectID.uriRepresentation().absoluteString
            }
        }
    }

    init(name: String, dueDate: Date) {
        self.name = name
        self.dueDate = dueDate
        self.id = ""
    }

}

class TaskService {
    weak var output: CreateTaskServiceOutput!
    weak var getOutput: GetTaskServiceOutput!
    weak var deleteOutput: DeleteTaskServiceOutput!

    static let TaskEntityName = "Task"

    struct PropertyKeyPath {
        static let Name = "name"
        static let DueDate = "dueDate"
    }

    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func identifier(for object: NSManagedObject) -> String? {
        let managedContext = self.appDelegate.persistentContainer.viewContext
        if object.objectID.isTemporaryID {
            do {
                try managedContext.obtainPermanentIDs(for: [object])
            } catch {
                return nil
            }

        }
        return object.objectID.uriRepresentation().absoluteString
    }

    func objecID(from identifier:String) -> NSManagedObject? {
        let managedContext = self.appDelegate.persistentContainer.viewContext
       guard let objectURI = URL(string: identifier) else {
           return nil
       }
       guard let objectID = managedContext.persistentStoreCoordinator?.managedObjectID(forURIRepresentation: objectURI) else {
           return nil
       }
        return managedContext.object(with: objectID)
    }
}

extension TaskService: CreateTaskServiceInput {
    func create(task: TaskWrapper) {
        let managedContext = self.appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: TaskService.TaskEntityName, in: managedContext)!

        let taskDB = NSManagedObject(entity: entity, insertInto: managedContext)

        taskDB.setValue(task.name, forKeyPath: TaskService.PropertyKeyPath.Name)
        taskDB.setValue(task.dueDate, forKeyPath: TaskService.PropertyKeyPath.DueDate)

        do {
            try managedContext.save()
            guard  let id = identifier(for: taskDB) else {
                output.createTaskDidFailed(error: Error.CreateTask.SaveError)
                return
            }
            var updatedTask = task
            updatedTask.id = id
            output.createTaskDidSucceed(createdTask: updatedTask)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            output.createTaskDidFailed(error: Error.CreateTask.SaveError)
        }
    }
}

extension TaskService: GetTaskServiceInput {
    func get() {
        let managedContext = self.appDelegate.persistentContainer.viewContext

        let fetchRequest =
                NSFetchRequest<NSManagedObject>(entityName: TaskService.TaskEntityName)
        do {
            let managedObjects = try managedContext.fetch(fetchRequest)
            let task = managedObjects.map { TaskWrapper(managedObject: $0) }
            getOutput.getTaskDidSucceed(tasks: task)
        } catch {
            getOutput.getTaskDidFailed(error: Error.GetTask.CannotFetch)
        }
    }
}

extension TaskService: DeleteTaskServiceInput {
    func delete(with id: String) {
        let managedContext = self.appDelegate.persistentContainer.viewContext
        guard let taskToDelete = objecID(from: id) else {
            deleteOutput.deleteTaskDidFailed(with: id, and: Error.DeleteTask.CannotDelete)
            return
        }
        managedContext.delete(taskToDelete)
        do {
            try managedContext.save()
            deleteOutput.deleteTaskDidSucceed(with: id)
        } catch {
            deleteOutput.deleteTaskDidFailed(with: id, and: Error.DeleteTask.CannotDelete)
        }
    }
}