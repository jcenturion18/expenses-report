//
//  Array.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 26/06/2022.
//

import Foundation

extension Array where Element == Expense {
    func totalIncome() -> Float {
        filter { $0.transaction == .income}.reduce(0) {$0 + $1.amount}
    }

    func totalExpenses() -> Float {
        filter { $0.transaction == .expense}.reduce(0) {$0 + $1.amount}
    }

    private func toDictionary() -> [String: [Expense]] {
        var expensesDictionary = [String: [Expense]]()

        forEach {
            let dateAsString = $0.date.toString()
            if expensesDictionary.keys.contains(dateAsString) {
                expensesDictionary[dateAsString]!.append($0)
            } else {
                expensesDictionary[dateAsString] = [Expense]()
                expensesDictionary[dateAsString]!.append($0)
            }
        }
        return expensesDictionary
    }

    func toExpensesByDayArray() -> [ExpensesByDay] {
        toDictionary().toObject()
    }
}
