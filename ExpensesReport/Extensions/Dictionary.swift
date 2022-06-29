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

        return transactionsByDay
    }
}
