//
//  TransactionListViewModelMock.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 29/06/2022.
//

import Foundation
@testable import ExpensesReport

class TransactionListViewModelMock: TransactionListViewModel {

    required init(withDB database: DataBase) {

    }

    var bindViewModelToController : ((_ transactionListData: TransactionListData) -> Void) = {_ in }

    func loadTransactionsData() {
        let transactionListData = TransactionListData(
            transactions: [
                TransactionsByDay(
                    title: "12th January, 1990",
                    transactions: [
                        Transaction(description: "Salary",
                                    date: "30/05/2022".toDate(),
                                    amount: 10,
                                    type: .income),
                        Transaction(description: "Coffe",
                                    date: "30/05/2022".toDate(),
                                    amount: 7,
                                    type: .income)
                    ]
                )
            ],
            summary: Summary(income: 10, expenses: 7)
        )

        bindViewModelToController(transactionListData)
    }

    func transactionCreated(_ transaction: Transaction) {

    }

    func transaction(for indexPath: IndexPath) -> Transaction {
        Transaction(description: "Salary",
                    date: "30/05/2022".toDate(),
                    amount: 10,
                    type: .income)
    }

    func delete(transaction: Transaction) {

    }
}
