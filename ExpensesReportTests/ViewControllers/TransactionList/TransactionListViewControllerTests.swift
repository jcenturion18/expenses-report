//
//  TransactionListViewControllerTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 29/06/2022.
//

import XCTest
@testable import ExpensesReport
class TransactionListViewControllerTests: XCTestCase {

    func testViewControllerCreation() throws {
        let mockViewModel = TransactionListViewModelMock()
        let viewController = TransactionListViewController(withViewModel: mockViewModel)
        _ = viewController.view

        XCTAssertEqual(1, viewController.expensesTableView.numberOfSections)
        XCTAssertEqual(3, viewController.expensesTableView.numberOfRows(inSection: 0))
        XCTAssertEqual("$ 10.0", viewController.incomeAmountLabel.text)
        XCTAssertEqual("$ 7.0", viewController.expensesAmountLabel.text)
        XCTAssertEqual("$ 3.0", viewController.balanceAmountLabel.text)
        XCTAssertEqual(0.7, viewController.progressBar.progress)
    }
}
