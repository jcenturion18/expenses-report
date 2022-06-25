//
//  ExpensesListViewModel.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation
struct ExpensesData {}

class ExpensesListViewModel {

    private(set) var expensesData: ExpensesData!

    init() {
        loadExpensesData()
    }

    func loadExpensesData() {
        expensesData = ExpensesData()
    }
}
