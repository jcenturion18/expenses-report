//
//  ExpensesTableViewDataSource.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 26/06/2022.
//

import UIKit

class TransactionTableViewDataSource: NSObject, UITableViewDataSource {

    private var transactions: [TransactionsByDay] = []

    func update(transactions: [TransactionsByDay]) {
        self.transactions = transactions
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions[section].transactions.count + 1 // Add one so we can use the header as a row
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TransactionTableViewCell.description()
        ) as! TransactionTableViewCell
        // swiftlint:enable force_cast

        if indexPath.row == 0 {
            cell.setUp(withTransactionsByDay: transactions[indexPath.section])
        } else {
            cell.setUp(withTransaction: transactions[indexPath.section].transactions[indexPath.row - 1])
        }
        return cell
    }
}
