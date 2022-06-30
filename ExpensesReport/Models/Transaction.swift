//
//  Transaction.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

struct Transaction {

    let description: String
    let date: Date
    let amount: Float
    let type: TransactionType
    let id: String

    init (description: String,
          date: Date,
          amount: Float,
          type: TransactionType,
          id: String = UUID().uuidString) {
        self.description = description
        self.date = date
        self.amount = amount
        self.type = type
        self.id = id
    }
}

enum TransactionType: String, CaseIterable {
case expense = "Expense", income = "Income"
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
    var transactions: [Transaction]
}
