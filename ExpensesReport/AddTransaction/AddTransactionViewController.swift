//
//  AddTransactionViewController.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 28/06/2022.
//

import UIKit

class AddTransactionViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.rondedView()
        let backgroundTap = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        view.addGestureRecognizer(backgroundTap)
    }

    @objc func dismissController() {
        dismiss(animated: true, completion: nil)
    }
}
