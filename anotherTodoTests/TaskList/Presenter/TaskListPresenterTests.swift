//
//  TaskListTaskListPresenterTests.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import XCTest

class TaskListPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: TaskListInteractorInput {

    }

    class MockRouter: TaskListRouterInput {

    }

    class MockViewController: TaskListViewInput {

        func setupInitialState() {

        }
    }
}
