//
//  Dictionary.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 26/06/2022.
//

import Foundation

extension Dictionary where Key == String, Value == [Transaction] {

    func toObject() -> [TransactionsByDay] {

        var transactionsByDay = [TransactionsByDay]()

        for(date, transactions) in self {
            transactionsByDay.append(TransactionsByDay(title: date, transactions: transactions))
        }

        transactionsByDay = transactionsByDay.sorted {
            $0.transactions[0].date.compare($1.transactions[0].date) == .orderedDescending
        }
        return transactionsByDay
    }
}
