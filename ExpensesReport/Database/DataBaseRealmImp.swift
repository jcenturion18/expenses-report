//
//  DataBaseRealmImp.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 30/06/2022.
//

import Foundation
import RealmSwift

class DataBaseRealmImp: DataBase {

    let localRealm: Realm
    let transactions: Results<TransactionDAO>
    var notificationToken: AnyObject?

    var observer : ((_ transactions: [Transaction]) -> Void)? {
        didSet {
            notificationToken = transactions.observe { (changes) in
                switch changes {
                case .initial: break
                case .update:
                    self.observer!(self.retrieveTransactions())
                case .error(let error):
                    fatalError("\(error)")
                }
            }
        }
    }

    init () {
        let config = Realm.Configuration(schemaVersion: 2)
        Realm.Configuration.defaultConfiguration = config

        localRealm = try! Realm() // swiftlint:disable:this force_try
        transactions = localRealm.objects(TransactionDAO.self)
    }

    deinit {
        notificationToken?.invalidate()
    }

    func store(transaction: Transaction) {
        try! localRealm.write { // swiftlint:disable:this force_try
            localRealm.add(TransactionDAO.from(transaction))
        }
    }

    func retrieveTransactions() -> [Transaction] {
        var transactionsList: [Transaction] = []

        transactions.forEach {
            transactionsList.append( $0.toTransaction() )
        }

        return transactionsList
    }

    func delete(transaction: Transaction) {
        let transactionToDelete = transactions.where {
            $0.id == transaction.id
        }

        try! localRealm.write { // swiftlint:disable:this force_try
            localRealm.delete(transactionToDelete)
        }
    }

}
