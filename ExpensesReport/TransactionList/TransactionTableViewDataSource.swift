//
//  ExpensesTableViewDataSource.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 26/06/2022.
//

import UIKit

class TransactionTableViewDataSource: NSObject, UITableViewDataSource {

    let expenses: [TransactionsByDay]
    init(withExpensesByDayArray data: [TransactionsByDay]) {
        self.expenses = data
        super.init()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expenses[section].expenses.count + 1 // Add one so we can use the header as a row
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        expenses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TransactionTableViewCell.description()
        ) as! TransactionTableViewCell
        // swiftlint:enable force_cast

        if indexPath.row == 0 {
            cell.setUp(withExpensesByDay: expenses[indexPath.section])
        } else {
            cell.setUp(withExpense: expenses[indexPath.section].expenses[indexPath.row - 1])
        }
        return cell
    }
}
