//
//  AddTransactionViewControllerDelegate.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 28/06/2022.
//

import Foundation

protocol AddTransactionViewControllerDelegate: AnyObject {
    func transactionCreated(_ transaction: Transaction)
}
