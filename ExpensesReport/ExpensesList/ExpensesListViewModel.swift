//
//  ExpensesListViewModel.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

class ExpensesListViewModel {

    private(set) var expensesData: ExpensesData! {
        didSet {
            bindViewModelToController(expensesData)
        }
    }

    var bindViewModelToController : ((_ expensesData: ExpensesData) -> Void) = {_ in }

    func loadExpensesData() {
        expensesData = ExpensesData()
    }
}
