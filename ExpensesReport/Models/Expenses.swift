//
//  Expenses.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

struct Expenses {
    let expenses: [Expense]
}

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
}

struct ExpensesListData {
    let expenses: [Expense]
    let summary: Summary
}

extension Expenses {
    func totalIncome() -> Float {
        expenses.filter { $0.transaction == .income}.reduce(0) {$0 + $1.amount}
    }

    func totalExpenses() -> Float {
        expenses.filter { $0.transaction == .expense}.reduce(0) {$0 + $1.amount}
    }
}
