//
//  ExpenseTableViewCell.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 27/06/2022.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var accesoryLabel: UILabel!

    func setUp(withExpense expense: Expense) {
        titleLabel.text = expense.description
        accesoryLabel.text = processAmount(value: expense.amount, for: expense.transaction)
    }

    func setUp(withExpensesByDay expenses: ExpensesByDay) {
        titleLabel.text = expenses.title
        accesoryLabel.text = ""
    }

    func processAmount(value: Float, for transaction: Transaction) -> String {
        (transaction == .income) ? "$\(value)": "- $\(value)"
    }
}
