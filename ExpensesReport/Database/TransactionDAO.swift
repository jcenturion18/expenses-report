//
//  TransactionDAO.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 30/06/2022.
//

import Foundation
import RealmSwift

class TransactionDAO: Object {
    @Persisted var transactionDescription: String
    @Persisted var date: Date
    @Persisted var amount: Float
    @Persisted var transactionType: String
    @Persisted var id: String

    static func from(_ transaction: Transaction) -> TransactionDAO {
        let transactionDAO = TransactionDAO()
        transactionDAO.transactionDescription = transaction.description
        transactionDAO.date = transaction.date
        transactionDAO.amount = transaction.amount
        transactionDAO.transactionType = transaction.type.rawValue
        transactionDAO.id = transaction.id
        return transactionDAO
    }

    func toTransaction() -> Transaction {
        return Transaction(
            description: transactionDescription,
            date: date,
            amount: amount,
            type: TransactionType.init(rawValue: transactionType)!,
            id: id
        )
    }
}
