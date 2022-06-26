//
//  ExpensesTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 25/06/2022.
//

import XCTest
@testable import ExpensesReport

class ExpensesTests: XCTestCase {

    func testTotalIncome() throws {
        let expenses = Expenses(expenses: [
            Expense(description: "Coffee", date: Date.now, amount: 7, transaction: .income),
            Expense(description: "Coffee", date: Date.now, amount: 7, transaction: .income)
        ])

        XCTAssertEqual(14, expenses.totalIncome())
    }

    func testTotalExpenses() throws {
        let expenses = Expenses(expenses: [
            Expense(description: "Coffee", date: Date.now, amount: 7, transaction: .expense),
            Expense(description: "Coffee", date: Date.now, amount: 7, transaction: .expense)
        ])

        XCTAssertEqual(14, expenses.totalExpenses())
    }

}
