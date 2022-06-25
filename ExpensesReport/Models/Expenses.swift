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
