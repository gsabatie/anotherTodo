//
//  TaskListTaskListConfiguratorTests.swift
//  anotherTodo
//
//  Created by Guillaume on 07/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import XCTest

class TaskListModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = TaskListViewControllerMock()
        let configurator = TaskListModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "TaskListViewController is nil after configuration")
        XCTAssertTrue(viewController.output is TaskListPresenter, "output is not TaskListPresenter")

        let presenter: TaskListPresenter = viewController.output as! TaskListPresenter
        XCTAssertNotNil(presenter.view, "view in TaskListPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in TaskListPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is TaskListRouter, "router is not TaskListRouter")

        let interactor: TaskListInteractor = presenter.interactor as! TaskListInteractor
        XCTAssertNotNil(interactor.output, "output in TaskListInteractor is nil after configuration")
    }

    class TaskListViewControllerMock: TaskListViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
