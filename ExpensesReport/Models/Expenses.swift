//
//  Expenses.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

struct Expense {
    let description: String
    let date: Date
    let amount: Float
    let transaction: Transaction
}

enum Transaction {
case expense, income
}

struct Summary {
    let income: Float
    let expenses: Float
    let balance: Float
    init(income: Float, expenses: Float) {
        self.income = income
        self.expenses = expenses
        self.balance = income - expenses
    }
}

struct ExpensesListData {
    let expenses: [ExpensesByDay]
    let summary: Summary
}

struct ExpensesByDay {
    let title: String
    let expenses: [Expense]
}
