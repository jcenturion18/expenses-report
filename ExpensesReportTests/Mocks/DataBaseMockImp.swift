//
//  DataBaseMockImp.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 30/06/2022.
//

import Foundation
@testable import ExpensesReport

class DataBaseMockImp: DataBase {

    var transactions: [Transaction] = []

    func retrieveTransactions() -> [Transaction] {
        transactions
    }

    func store(transaction: Transaction) {
        transactions.append(transaction)
    }

    func delete(transaction: Transaction) {
        transactions.removeAll { $0.id == transaction.id }
    }

    var observer: (([Transaction]) -> Void)?
}
