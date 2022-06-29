//
//  AddTransactionViewControllerDelegateMock.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 29/06/2022.
//

import Foundation
@testable import ExpensesReport

class AddTransactionViewControllerDelegateMock: AddTransactionViewControllerDelegate {
    var transaction: Transaction!

    func transactionCreated(_ transaction: Transaction) {
        self.transaction = transaction
    }
}
