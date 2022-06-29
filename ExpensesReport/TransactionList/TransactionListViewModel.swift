//
//  ExpensesListViewModel.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

protocol TransactionListViewModel: AnyObject {
    var bindViewModelToController : ((_ transactionListData: TransactionListData) -> Void) { get set }
    func loadTransactionsData()
    func transactionCreated(_ transaction: Transaction)
    func deleteTransaction(at indexPath: IndexPath)
}

class TransactionListViewModelImp: TransactionListViewModel {

    private var transactions = [
        Transaction(description: "Salary", date: "30/05/2022".toDate(), amount: 10, transaction: .income),
        Transaction(description: "Coffee", date: "26/05/2022".toDate(), amount: 7, transaction: .expense),
        Transaction(description: "Salary", date: "26/05/2022".toDate(), amount: 10, transaction: .income)
    ] {
        didSet {
            loadTransactionsData()
        }
    }

    private var transactionListData: TransactionListData! {
        didSet {
            bindViewModelToController(transactionListData)
        }
    }

    var bindViewModelToController : ((_ transactionListData: TransactionListData) -> Void) = {_ in }

    func loadTransactionsData() {
        transactionListData = proccess(transactions: transactions)
    }

    func proccess(transactions: [Transaction]) -> TransactionListData {

        let totalIncome = transactions.totalIncome()
        let totalExpenses = transactions.totalExpenses()

        let summary = Summary(income: totalIncome, expenses: totalExpenses)

        return TransactionListData(transactions: transactions.toTransactionsByDayArray(), summary: summary)
    }

    func deleteTransaction(at indexPath: IndexPath) {
        transactionListData.transactions[indexPath.section].transactions.remove(at: indexPath.row - 1)
        if transactionListData.transactions[indexPath.section].transactions.count == 0 {
            transactionListData.transactions.remove(at: indexPath.section)
        }
    }

    func transactionCreated(_ transaction: Transaction) {
        transactions.append(transaction)
    }
}

// TODO: Remove
extension String {

    func toDate() -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd,MM,yyyy"
        return dateFormater.date(from: self)!
    }
}
