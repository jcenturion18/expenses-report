//
//  ExpenseTableViewCellTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 28/06/2022.
//

import XCTest
@testable import ExpensesReport

class TransactionTableViewCellTests: XCTestCase {

    func testSetUpViewWithTransactionIncome() throws {

        let cell = TransactionTableViewCell.loadNib()

        let transaction = Transaction(description: "Description",
                              date: "12/01/1990".toDate(),
                              amount: 10,
                              type: .income)

        cell.setUp(withTransaction: transaction)

        XCTAssertEqual("Description", cell.titleLabel.text)
        XCTAssertEqual("$10.0", cell.accesoryLabel.text)
    }

    func testSetUpViewWithTransactionNegativeExpense() throws {
        let cell = TransactionTableViewCell.loadNib()

        let transaction = Transaction(description: "Description",
                              date: "12/01/1990".toDate(),
                              amount: 10,
                              type: .expense)

        cell.setUp(withTransaction: transaction)

        XCTAssertEqual("Description", cell.titleLabel.text)
        XCTAssertEqual("- $10.0", cell.accesoryLabel.text)
    }

    func testSetUpViewWithExpensesByDay() throws {
        let cell = TransactionTableViewCell.loadNib()

        let transactionsByDay = TransactionsByDay(title: "Day", transactions: [])

        cell.setUp(withTransactionsByDay: transactionsByDay)

        XCTAssertEqual("Day", cell.titleLabel.text)
        XCTAssertEqual("", cell.accesoryLabel.text)
    }
}
