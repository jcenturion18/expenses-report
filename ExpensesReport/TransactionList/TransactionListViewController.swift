//
//  ExpensesListViewController.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import UIKit

class TransactionListViewController: UIViewController {

    // MARK: - Balance view properties
    @IBOutlet weak var expensesAmountLabel: UILabel!
    @IBOutlet weak var incomeAmountLabel: UILabel!
    @IBOutlet weak var balanceAmountLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var balanceBackgroundView: UIView!

    // MARK: - Table view
    @IBOutlet weak var expensesTableView: UITableView!
    // MARK: - View Model
    private let viewModel: TransactionListViewModel
    private var expensesTableViewDataSource: TransactionTableViewDataSource!

    // MARK: - Constructor
    init(withViewModel viewModel: TransactionListViewModel = TransactionListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        expensesTableView.delegate = self
        setUpBalanceView()
        observeChanges()
        registerCellsOnTableView()
        viewModel.loadExpensesData()
    }

    // MARK: View
    func registerCellsOnTableView() {
        let expenseTableViewCell = UINib(
            nibName: String.init(describing: TransactionTableViewCell.self),
            bundle: Bundle.main)

        expensesTableView.register(expenseTableViewCell,
                                   forCellReuseIdentifier: TransactionTableViewCell.description())
    }

    func setUpBalanceView() {
        balanceBackgroundView.rondedView()
    }

    func observeChanges() {
        viewModel.bindViewModelToController = { transactionListData in
            print(transactionListData)
            self.update(summary: transactionListData.summary)
            self.update(transactionsTable: transactionListData.transactions)
        }
    }

    func update(summary data: Summary) {
        expensesAmountLabel.text = "$ \(data.expenses)"
        incomeAmountLabel.text = "$ \(data.income)"
        balanceAmountLabel.text = "$ \(data.balance)"

        let percent = ((data.expenses * 100)/data.income).normalize()
        progressBar.progress = percent
    }

    func update(transactionsTable data: [TransactionsByDay]) {
        expensesTableViewDataSource = TransactionTableViewDataSource(withExpensesByDayArray: data)

        DispatchQueue.main.async {
            self.expensesTableView.dataSource = self.expensesTableViewDataSource
            self.expensesTableView.reloadData()
        }
    }
}

extension TransactionListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard indexPath.row != 0 else {
            return nil
        }

        let item = UIContextualAction(style: .destructive, title: "Delete") {  (_, _, _) in
            self.viewModel.deleteExpense(at: indexPath)
        }

        let swipeActions = UISwipeActionsConfiguration(actions: [item])
        return swipeActions
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        RoudedSectionTableView.tableView(tableView, willDisplay: cell, forRowAt: indexPath)
    }
}