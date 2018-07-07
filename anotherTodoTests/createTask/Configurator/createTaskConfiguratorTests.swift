//
//  CreateTaskCreateTaskConfiguratorTests.swift
//  anotherTodo
//
//  Created by Guillaume on 02/07/2018.
//  Copyright © 2018 gsabatie. All rights reserved.
//

import XCTest

class CreateTaskModuleConfiguratorTests: XCTestCase {

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
        let viewController = CreateTaskViewControllerMock()
        let configurator = CreateTaskModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CreateTaskViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CreateTaskPresenter, "output is not CreateTaskPresenter")

        let presenter: CreateTaskPresenter = viewController.output as! CreateTaskPresenter
        XCTAssertNotNil(presenter.view, "view in CreateTaskPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CreateTaskPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CreateTaskRouter, "router is not CreateTaskRouter")

        let interactor: CreateTaskInteractor = presenter.interactor as! CreateTaskInteractor
        XCTAssertNotNil(interactor.output, "output in CreateTaskInteractor is nil after configuration")
    }

    class CreateTaskViewControllerMock: CreateTaskViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
