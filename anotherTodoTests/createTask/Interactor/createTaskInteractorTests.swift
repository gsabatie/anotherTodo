//
//  CreateTaskCreateTaskInteractorTests.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import anotherTodo


extension TaskWrapper: Equatable {
    static public func ==(lhs: TaskWrapper, rhs: TaskWrapper) -> bool {
        return lhs.name == rhs.name && lhs.dueDate == rhs.dueDate
    }
}

class CreateTaskInteractorSpec: QuickSpec {
    private var interactor = CreateTaskInteractor()
    private var mockCreateTaskService: MockCreateTaskService!
    private var mockPresenter: MockPresenter!

    private let taskWithGoodParameter = TaskWrapper(name: "Todo", dueDate: Date())
    private let taskWithMissingName = TaskWrapper(name: "", dueDate: Date())

    private func setupModule() {
        mockCreateTaskService = MockCreateTaskService()
        mockPresenter = MockPresenter()

        interactor.createTaskService = mockCreateTaskService
        interactor.output = mockPresenter

        mockCreateTaskService.output = interactor
    }

    override func spec() {
        describe("CreateTaskInteractor") {


            context("should succeed to create task") {

                beforeEach {
                    self.setupModule()
                }

                it("should call createService create function") {
                    self.interactor.save(task: self.taskWithGoodParameter)
                    expect(self.mockCreateTaskService.createTaskCalled).to(beTrue())
                }
                it("should call presenter success auth function") {
                    self.interactor.save(task: self.taskWithGoodParameter)
                    expect(self.mockPresenter.saveDidSucceedCalled).to(beTrue())
                }

                it("should create a task in the createService") {
                    self.interactor.save(task: self.taskWithGoodParameter)
                    expect(self.mockCreateTaskService.tasks.first).to(equal(self.taskWithGoodParameter))
                }
            }
        }

        class MockPresenter: CreateTaskInteractorOutput {
            var saveDidSucceedCalled = false
            var saveDidFailedCalled = false

            func saveDidSucceed() {
                saveDidSucceedCalled = true
            }

            func saveDidFailed(with error: Error.CreateTask) {
                saveDidFailedCalled = true
            }
        }

        class MockCreateTaskService: CreateTaskServiceInput {
            weak var output: CreateTaskServiceOutput!

            var tasks = [TaskWrapper]()
            var createTaskCalled = false

            func create(task: TaskWrapper) {
                tasks.append(task)
                createTaskCalled = true
            }
        }
    }

