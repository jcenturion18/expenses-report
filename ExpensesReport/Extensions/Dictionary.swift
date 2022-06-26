//
//  Dictionary.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 26/06/2022.
//

import Foundation

extension Dictionary where Key == String, Value == [Expense] {

    func toObject() -> [ExpensesByDay] {

        var expensesByDay = [ExpensesByDay]()

        for(date, expenses) in self {
            expensesByDay.append(ExpensesByDay(title: date, expenses: expenses))
        }

        return expensesByDay
    }
}
