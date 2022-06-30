//
//  AddTransactionViewControllerTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 29/06/2022.
//

import XCTest
@testable import ExpensesReport

class AddTransactionViewControllerTests: XCTestCase {

    func testAddActionValidData() throws {
        let viewController = AddTransactionViewController()

        let delegate = AddTransactionViewControllerDelegateMock()
        viewController.setDelegate(delegate)

        _ = viewController.view

        // swiftlint:disable force_cast
        let picker = viewController.transactionTypeInput.inputView as! UIPickerView
        // swiftlint:enable force_cast
        viewController.pickerView(picker, didSelectRow: 0, inComponent: 0)
        viewController.transactionDescriptionInput.text = "Description"
        viewController.amountInput.text = "100"

        viewController.addAction(self)

        XCTAssertNotNil(delegate.transaction)
        XCTAssertEqual("Description", delegate.transaction.description)
        XCTAssertEqual(100, delegate.transaction.amount)
        XCTAssertEqual(TransactionType.expense, delegate.transaction.type)
    }

    func testAddActionIndalidData() throws {
        let viewController = AddTransactionViewController()

        let delegate = AddTransactionViewControllerDelegateMock()
        viewController.setDelegate(delegate)

        _ = viewController.view

        viewController.addAction(self)

        XCTAssertNil(delegate.transaction)
    }
}
