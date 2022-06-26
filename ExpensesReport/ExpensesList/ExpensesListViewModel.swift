//
//  ExpensesListViewModel.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

class ExpensesListViewModel {

    private var expensesListData: ExpensesListData! {
        didSet {
            bindViewModelToController(expensesListData)
        }
    }

    var bindViewModelToController : ((_ expenses: ExpensesListData) -> Void) = {_ in }

    func loadExpensesData() {
        let expenses = [
            Expense(description: "Salary", date: "30/05/2022".toDate(), amount: 10, transaction: .income),
            Expense(description: "Coffee", date: "26/05/2022".toDate(), amount: 7, transaction: .expense),
            Expense(description: "Salary", date: "26/05/2022".toDate(), amount: 10, transaction: .income)
        ]

        expensesListData = proccess(expenses: expenses)

    }

    func proccess(expenses: [Expense]) -> ExpensesListData {

        let totalIncome = expenses.totalIncome()
        let totalExpenses = expenses.totalExpenses()

        let summary = Summary(income: totalIncome, expenses: totalExpenses)

        return ExpensesListData(expenses: expenses.toExpensesByDayArray(), summary: summary)
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
