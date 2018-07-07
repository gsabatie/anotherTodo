//
//  CreateTaskCreateTaskViewController.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import UIKit
import DateTimePicker
import TextFieldEffects

class CreateTaskViewController: UIViewController {

    @IBOutlet private weak var taskTextField: HoshiTextField!
    @IBOutlet private weak var dueDateTextField: HoshiTextField!
    @IBOutlet private weak var createButton: UIButton!

    var output: CreateTaskViewOutput!

    private var dueDate : Date?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.delegate = self
        output.viewIsReady()
    }

    @IBAction func CreateButtonDidTouchUpInside(_ sender: UIButton) {
        output.createButtonDidTouch()
    }

    // MARK: CreateTaskViewInput
    func setupInitialState() {
    }
}

extension CreateTaskViewController: CreateTaskViewInput {
    func getTaskName() -> String {
        return taskTextField.text ?? ""
    }

    func getDueDate() -> Date? {
        return  dueDate
    }


    func display(with message: String) {
        let allertViewController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            allertViewController.dismiss(animated: true, completion: nil)
        }
        allertViewController.addAction(cancelAction)
        self.present(allertViewController, animated: true, completion: nil)
    }
}

extension CreateTaskViewController: UITextFieldDelegate {

    var dateFormater: DateFormatter {
        let dateformater = DateFormatter()
        dateformater.dateFormat = DATE_FORMAT.TASKDATE
        return dateformater
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let picker = DateTimePicker.show()
        picker.isDatePickerOnly = true
        picker.highlightColor = UIColor(red: 165.0 / 255.0, green: 152.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        picker.completionHandler = { date in
            self.dueDate = date
            textField.text = self.dateFormater.string(from: date)
        }
        return false
    }
}
