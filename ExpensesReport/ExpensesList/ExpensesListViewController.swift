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

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBalanceView()

        // Do any additional setup after loading the view.
    }

    func setUpBalanceView() {
        balanceBackgroundView.rondedView()
    }
}
