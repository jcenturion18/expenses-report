//
//  TransactionInputValidation.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 28/06/2022.
//

import Foundation

class TransactionInputValidation {

    static func validateInput(amount: String?,
                              description: String?,
                              transactionType: TransactionType?) -> (Bool, Transaction?) {
        guard let amount = amount,
              let amountFloat = Float(amount),
              amountFloat > 0,
              let description = description,
              description.count > 0,
              let transactionType = transactionType
        else {
            return (false, nil)
        }

        let transaction = Transaction(description: description,
                                      date: Date.now,
                                      amount: amountFloat,
                                      type: transactionType)

        return(true, transaction)
    }
}
