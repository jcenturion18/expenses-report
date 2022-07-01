//
//  TransactionListViewModelTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 30/06/2022.
//

import XCTest
@testable import ExpensesReport

class TransactionListViewModelTests: XCTestCase {

    func testAddTransaction() throws {
        let viewModel = TransactionListViewModelImp(withDB: DataBaseMockImp())

        let transaction = Transaction(description: "",
                                      date: "12/01/90".toDate(),
                                      amount: 10,
                                      type: .income,
                                      id: "1")

        viewModel.transactionCreated(transaction)

        viewModel.bindViewModelToController = { transaction in
            XCTAssertEqual(1, transaction.transactions.count)
            XCTAssertEqual(1, transaction.transactions[0].transactions.count)
        }
    }

    func testRemoveTransaction() throws {

        let database = DataBaseMockImp()

        let transaction = Transaction(description: "",
                                      date: "12/01/90".toDate(),
                                      amount: 10,
                                      type: .income,
                                      id: "1")

        database.transactions.append(transaction)
        let viewModel = TransactionListViewModelImp(withDB: database)

        viewModel.delete(transaction: transaction)

        viewModel.bindViewModelToController = { transaction in
            XCTAssertEqual(0, transaction.transactions.count)
        }
    }

    func testGetCorrectTransaction() throws {
        let database = DataBaseMockImp()

        let transaction = Transaction(description: "",
                                      date: "12/01/90".toDate(),
                                      amount: 10,
                                      type: .income,
                                      id: "1")
        let otherTransaction = Transaction(description: "",
                                      date: "12/01/90".toDate(),
                                      amount: 10,
                                      type: .income,
                                      id: "2")

        database.transactions.append(transaction)
        database.transactions.append(otherTransaction)

        let viewModel = TransactionListViewModelImp(withDB: database)

        viewModel.loadTransactionsData()

        let indexpath = IndexPath(row: 1, section: 0)
        let transactionFound = viewModel.transaction(for: indexpath)

        XCTAssertEqual("1", transactionFound.id)

    }
}
