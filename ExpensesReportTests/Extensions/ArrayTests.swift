//
//  ArrayTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 25/06/2022.
//

import XCTest
@testable import ExpensesReport

class ArrayTests: XCTestCase {

    func testTotalIncome() throws {
        let expenses = [
            Transaction(description: "Coffee",
                        date: "12/01/1990".toDate(),
                        amount: 7,
                        type: .income),
            Transaction(description: "Coffee",
                        date: "12/01/1990".toDate(),
                        amount: 7,
                        type: .income)
        ]

        XCTAssertEqual(14, expenses.totalIncome())
    }

    func testTotalExpenses() throws {
        let expenses = [
            Transaction(description: "Coffee", date: "12/01/1990".toDate(), amount: 7, type: .expense),
            Transaction(description: "Coffee", date: "12/01/1990".toDate(), amount: 7, type: .expense)
        ]

        XCTAssertEqual(14, expenses.totalExpenses())
    }

    func testToExpensesByDayArray() throws {
        let expenses = [
            Transaction(description: "Coffee", date: "12/01/1990".toDate(), amount: 7, type: .expense),
            Transaction(description: "Coffee", date: "12/01/1990".toDate(), amount: 7, type: .expense)
        ]

        let expensesByDayArray = expenses.toTransactionsByDayArray()
        XCTAssertEqual(1, expensesByDayArray.count)
        XCTAssertEqual("12th January, 1990", expensesByDayArray[0].title)
        XCTAssertEqual(2, expensesByDayArray[0].transactions.count)
    }

}
