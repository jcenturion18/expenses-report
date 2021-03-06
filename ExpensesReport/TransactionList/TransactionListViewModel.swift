//
//  ExpensesListViewModel.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

protocol TransactionListViewModel: AnyObject {
    var bindViewModelToController : ((_ transactionListData: TransactionListData) -> Void) { get set }
    init (withDB database: DataBase)
    func loadTransactionsData()
    func transactionCreated(_ transaction: Transaction)
    func transaction(for indexPath: IndexPath) -> Transaction
    func delete(transaction: Transaction)
}

class TransactionListViewModelImp: TransactionListViewModel {

    let database: DataBase

    required init(withDB database: DataBase = DataBaseRealmImp()) {
        self.database = database
        self.database.observer = { transactions in
            self.transactionListData = self.proccess(transactions: transactions)
        }
    }

    private var transactionListData: TransactionListData! {
        didSet {
            bindViewModelToController(transactionListData)
        }
    }

    var bindViewModelToController : ((_ transactionListData: TransactionListData) -> Void) = {_ in }

    func loadTransactionsData() {
        transactionListData = proccess(transactions: database.retrieveTransactions())
    }

    func proccess(transactions: [Transaction]) -> TransactionListData {

        let totalIncome = transactions.totalIncome()
        let totalExpenses = transactions.totalExpenses()

        let summary = Summary(income: totalIncome, expenses: totalExpenses)

        return TransactionListData(transactions: transactions.toTransactionsByDayArray(), summary: summary)
    }

    func transaction(for indexPath: IndexPath) -> Transaction {
        transactionListData.transactions[indexPath.section].transactions[indexPath.row - 1]
    }

    func delete(transaction: Transaction) {
        database.delete(transaction: transaction)
    }

    func transactionCreated(_ transaction: Transaction) {
        database.store(transaction: transaction)
    }
}
