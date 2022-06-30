//
//  ExpenseTableViewCell.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 27/06/2022.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var accesoryLabel: UILabel!

    func setUp(withTransaction transaction: Transaction) {
        titleLabel.text = transaction.description
        accesoryLabel.text = processAmount(value: transaction.amount, for: transaction.type)
    }

    func setUp(withTransactionsByDay transactions: TransactionsByDay) {
        titleLabel.text = transactions.title
        accesoryLabel.text = ""
    }

    func processAmount(value: Float, for transaction: TransactionType) -> String {
        (transaction == .income) ? "$\(value)": "- $\(value)"
    }
}
