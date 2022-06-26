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
        let expenses = Expenses(expenses:
                                [
                                    Expense(description: "Coffee", date: Date.now, amount: 7, transaction: .expense),
                                    Expense(description: "Salary", date: Date.now, amount: 10, transaction: .income)
                                ]
        )
        expensesListData = proccess(expenses: expenses)

    }

    func proccess(expenses data: Expenses) -> ExpensesListData {

        let income = data.totalIncome()
        let expenses = data.totalExpenses()

        let summary = Summary(income: income, expenses: expenses, balance: (income - expenses))

        return ExpensesListData(expenses: data.expenses, summary: summary)
    }
}
