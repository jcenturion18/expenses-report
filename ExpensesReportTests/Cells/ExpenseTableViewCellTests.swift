//
//  ExpenseTableViewCellTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 28/06/2022.
//

import XCTest
@testable import ExpensesReport

class ExpenseTableViewCellTests: XCTestCase {

    func testSetUpViewWithExpenseIncome() throws {

        let cell = ExpenseTableViewCell.loadNib()

        let expense = Expense(description: "Description",
                              date: "12/01/1990".toDate(),
                              amount: 10,
                              transaction: .income)

        cell.setUp(withExpense: expense)

        XCTAssertEqual("Description", cell.titleLabel.text)
        XCTAssertEqual("$10.0", cell.accesoryLabel.text)
    }

    func testSetUpViewWithExpenseNegativeExpense() throws {
        let cell = ExpenseTableViewCell.loadNib()

        let expense = Expense(description: "Description",
                              date: "12/01/1990".toDate(),
                              amount: 10,
                              transaction: .expense)

        cell.setUp(withExpense: expense)

        XCTAssertEqual("Description", cell.titleLabel.text)
        XCTAssertEqual("- $10.0", cell.accesoryLabel.text)
    }

    func testSetUpViewWithExpensesByDay() throws {
        let cell = ExpenseTableViewCell.loadNib()

        let expensesByDay = ExpensesByDay(title: "Day", expenses: [])

        cell.setUp(withExpensesByDay: expensesByDay)

        XCTAssertEqual("Day", cell.titleLabel.text)
        XCTAssertEqual("", cell.accesoryLabel.text)
    }
}
