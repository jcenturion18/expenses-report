//
//  DataBase.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 30/06/2022.
//

import Foundation

protocol DataBase: AnyObject {
    func retrieveTransactions() -> [Transaction]
    func store(transaction: Transaction)
    func delete(transaction: Transaction)
    var observer : ((_ transactions: [Transaction]) -> Void)? { get set }
}
