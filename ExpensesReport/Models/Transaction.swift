//
//  Expenses.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

struct Transaction {
    let description: String
    let date: Date
    let amount: Float
    let transaction: TransactionType
}

enum TransactionType {
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

struct TransactionListData {
    var transactions: [TransactionsByDay]
    let summary: Summary
}

struct TransactionsByDay {
    let title: String
    var expenses: [Transaction]
}
