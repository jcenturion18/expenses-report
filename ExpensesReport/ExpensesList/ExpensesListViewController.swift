//
//  ExpensesListViewController.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import UIKit

class ExpensesListViewController: UIViewController {

    // MARK: - Balance view properties
    @IBOutlet weak var expensesAmountLabel: UILabel!
    @IBOutlet weak var incomeAmountLabel: UILabel!
    @IBOutlet weak var balanceAmountLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var balanceBackgroundView: UIView!

    // MARK: - View Model
    private let viewModel: ExpensesListViewModel

    init(withViewModel viewModel: ExpensesListViewModel = ExpensesListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBalanceView()
        observeChanges()
        viewModel.loadExpensesData()
    }

    func setUpBalanceView() {
        balanceBackgroundView.rondedView()
    }

    func observeChanges() {
        viewModel.bindViewModelToController = { expenses in
            print(expenses)
            self.update(summary: expenses.summary)
        }
    }

    func update(summary data: Summary) {
        expensesAmountLabel.text = "$ \(data.expenses)"
        incomeAmountLabel.text = "$ \(data.income)"
        balanceAmountLabel.text = "$ \(data.balance)"

        let percent = ((data.expenses * 100)/data.income).normalize()
        progressBar.progress = percent
    }
}
