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

    func setUp(withExpense expense: Transaction) {
        titleLabel.text = expense.description
        accesoryLabel.text = processAmount(value: expense.amount, for: expense.transaction)
    }

    func setUp(withExpensesByDay expenses: TransactionsByDay) {
        titleLabel.text = expenses.title
        accesoryLabel.text = ""
    }

    func processAmount(value: Float, for transaction: TransactionType) -> String {
        (transaction == .income) ? "$\(value)": "- $\(value)"
    }
}
