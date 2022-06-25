//
//  ExpensesListViewController.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import UIKit

class ExpensesListViewController: UIViewController {

    // MARK: - Balance view properties
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
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
        bindingViewModel()
        viewModel.loadExpensesData()
    }

    func setUpBalanceView() {
        balanceBackgroundView.rondedView()
    }

    func bindingViewModel() {
        viewModel.bindViewModelToController = { expeses in
            print(expeses)
        }
    }
}
