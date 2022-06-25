//
//  ExpensesListViewModel.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

class ExpensesListViewModel {

    private(set) var expenses: Expenses! {
        didSet {
            bindViewModelToController(expenses)
        }
    }

    var bindViewModelToController : ((_ expenses: Expenses) -> Void) = {_ in }

    func loadExpensesData() {
        expenses = Expenses(expenses:
                                [
                                    Expense(description: "Coffee", date: Date.now, amount: 7, transaction: .expense)
                                ]
        )
    }
}
