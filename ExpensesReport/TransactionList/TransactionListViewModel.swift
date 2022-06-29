//
//  ExpensesListViewModel.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

protocol TransactionListViewModel : AnyClass {}

class TransactionListViewModelImp {

    private var transactionListData: TransactionListData! {
        didSet {
            bindViewModelToController(transactionListData)
        }
    }

    var bindViewModelToController : ((_ transactionListData: TransactionListData) -> Void) = {_ in }

    func loadExpensesData() {
        let expenses = [
            Transaction(description: "Salary", date: "30/05/2022".toDate(), amount: 10, transaction: .income),
            Transaction(description: "Coffee", date: "26/05/2022".toDate(), amount: 7, transaction: .expense),
            Transaction(description: "Salary", date: "26/05/2022".toDate(), amount: 10, transaction: .income)
        ]

        transactionListData = proccess(expenses: expenses)

    }

    func proccess(expenses: [Transaction]) -> TransactionListData {

        let totalIncome = expenses.totalIncome()
        let totalExpenses = expenses.totalExpenses()

        let summary = Summary(income: totalIncome, expenses: totalExpenses)

        return TransactionListData(transactions: expenses.toExpensesByDayArray(), summary: summary)
    }

    func deleteExpense(at indexPath: IndexPath) {
        transactionListData.transactions[indexPath.section].expenses.remove(at: indexPath.row - 1)
        if transactionListData.transactions[indexPath.section].expenses.count == 0 {
            transactionListData.transactions.remove(at: indexPath.section)
        }
    }

    func transactionCreated(_ transaction: Transaction) {
        print(transaction)
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
