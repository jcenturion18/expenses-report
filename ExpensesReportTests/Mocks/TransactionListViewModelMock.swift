//
//  TransactionListViewModelMock.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 29/06/2022.
//

import Foundation
@testable import ExpensesReport

class TransactionListViewModelMock: TransactionListViewModel {

    var bindViewModelToController : ((_ transactionListData: TransactionListData) -> Void) = {_ in }

    func loadExpensesData() {
        let transactionListData = TransactionListData(
            transactions: [
                TransactionsByDay(
                    title: "12th January, 1990",
                    expenses: [
                        Transaction(description: "Salary",
                                    date: "30/05/2022".toDate(),
                                    amount: 10,
                                    transaction: .income),
                        Transaction(description: "Coffe",
                                    date: "30/05/2022".toDate(),
                                    amount: 7,
                                    transaction: .income)
                    ]
                )
            ],
            summary: Summary(income: 10, expenses: 7)
        )

        bindViewModelToController(transactionListData)
    }

    func transactionCreated(_ transaction: Transaction) {

    }

    func deleteExpense(at indexPath: IndexPath) {

    }
}
