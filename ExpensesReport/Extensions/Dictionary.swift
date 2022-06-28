//
//  Dictionary.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 26/06/2022.
//

import Foundation

extension Dictionary where Key == String, Value == [Transaction] {

    func toObject() -> [TransactionsByDay] {

        var expensesByDay = [TransactionsByDay]()

        for(date, expenses) in self {
            expensesByDay.append(TransactionsByDay(title: date, expenses: expenses))
        }

        return expensesByDay
    }
}
