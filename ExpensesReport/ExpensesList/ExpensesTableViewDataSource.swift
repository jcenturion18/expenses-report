//
//  ExpensesTableViewDataSource.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 26/06/2022.
//

import UIKit

class ExpensesTableViewDataSource: NSObject, UITableViewDataSource {

    let expenses: [ExpensesByDay]
    init(withExpensesByDayArray data: [ExpensesByDay]) {
        self.expenses = data
        super.init()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expenses[section].expenses.count + 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        expenses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        if  !(cell != nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }

        if indexPath.row == 0 {
            cell!.textLabel?.text = expenses[indexPath.section].title
        } else {
            cell!.textLabel?.text = expenses[indexPath.section].expenses[indexPath.row - 1].description
        }
        return cell!
    }
}
