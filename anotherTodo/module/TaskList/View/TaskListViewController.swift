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
}

extension TaskListViewController: UITableViewDelegate {
   
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

