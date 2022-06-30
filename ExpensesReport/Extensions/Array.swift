//
//  Array.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 26/06/2022.
//

import Foundation

extension Array where Element == Transaction {
    func totalIncome() -> Float {
        filter { $0.type == .income}.reduce(0) {$0 + $1.amount}
    }

    func totalExpenses() -> Float {
        filter { $0.type == .expense}.reduce(0) {$0 + $1.amount}
    }

    private func toDictionary() -> [String: [Transaction]] {
        var transactionsDictionary = [String: [Transaction]]()

        forEach {
            let dateAsString = $0.date.toString()
            if transactionsDictionary.keys.contains(dateAsString) {
                transactionsDictionary[dateAsString]!.append($0)
            } else {
                transactionsDictionary[dateAsString] = [Transaction]()
                transactionsDictionary[dateAsString]!.append($0)
            }
        }
        return transactionsDictionary
    }

    func toTransactionsByDayArray() -> [TransactionsByDay] {
        toDictionary().toObject()
    }
}
