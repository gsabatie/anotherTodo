//
//  TaskListTaskListViewController.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!

    private var displayedTask = [TaskWrapper]()
    let taskCellIdentifier = "taskCell"
    var output: TaskListViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        tableVIew.delegate = self
        tableVIew.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    // MARK: TaskListViewInput
    func setupInitialState() {
    }

    @IBAction func addBarButtonDidTouched(_ sender: UIBarButtonItem) {
        output.addButtonDidTouched()
    }
}

extension TaskListViewController: TaskListViewInput {
    func display(tasks: [TaskWrapper]) {
        displayedTask = tasks
        tableVIew.reloadData()
    }

    func display(message: String) {

    }

    func removeRow(at indexPath: IndexPath) {
        displayedTask.remove(at: indexPath.row)
        tableVIew.deleteRows(at: [indexPath], with: .fade)
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            output.deleteTaskButtonTouched(at: indexPath)
        }
    }

    func tableView(_ tableView: UITableView,
                   editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "Share" , handler: {[weak self] (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
            let activityViewController = UIActivityViewController(
                    activityItems: ["todo"],
                    applicationActivities: nil)

            self?.present(activityViewController, animated: true, completion: nil)
        })
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "Delete" , handler: { [weak self] (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
            self?.output.deleteTaskButtonTouched(at: indexPath)
        })
        return [shareAction, deleteAction]
    }
}

extension TaskListViewController: UITableViewDataSource {

    var dateFormater: DateFormatter {
        let dateformater = DateFormatter()
        dateformater.dateFormat = DATE_FORMAT.TASKDATE
        return dateformater
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedTask.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = displayedTask[indexPath.row]
        let cell = tableVIew.dequeueReusableCell(withIdentifier: taskCellIdentifier) ?? UITableViewCell()
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = dateFormater.string(from: task.dueDate)
        return cell
    }
}

