//
//  AddTransactionViewController.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 28/06/2022.
//

import UIKit
import SwiftUI

class AddTransactionViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var transactionTypeInput: UITextField!
    @IBOutlet weak var transactionDescriptionInput: UITextField!
    @IBOutlet weak var amountInput: UITextField!

    private var keyboardIsPresent = false
    private var selectedTransactionType: TransactionType?

    private var delegate: AddTransactionViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.roundedView()
        addBackgroundTap()
        setUpPickerView()
    }

    func setDelegate(_ delegate: AddTransactionViewControllerDelegate) {
        self.delegate = delegate
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearView()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillDisappear),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillAppear),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }

    func addBackgroundTap() {
        let backgroundTap = UITapGestureRecognizer(target: self, action: #selector(backgroundTap))
        view.addGestureRecognizer(backgroundTap)
    }

    @objc func backgroundTap() {
        if keyboardIsPresent {
            view.endEditing(true)
        } else {
            dissmissViewController()
        }
    }

    func setUpPickerView() {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        transactionTypeInput.inputView = pickerView
    }

    func clearView() {
        transactionTypeInput.text = ""
        transactionDescriptionInput.text = ""
        amountInput.text = ""
    }

    @IBAction func addAction(_ sender: Any) {
        view.endEditing(true)
        let validInput = TransactionInputValidation.validateInput(
            amount: amountInput.text,
            description: transactionDescriptionInput.text,
            transactionType: selectedTransactionType
        )
        if !validInput.0 {
            showErrorAlert()
            return
        }
        if let transaction = validInput.1 {
            delegate.transactionCreated(transaction)
            dissmissViewController()
        }
    }

    func dissmissViewController() {
        dismiss(animated: true, completion: nil)
    }

    func showErrorAlert() {
        let alertController = UIAlertController(
            title: "Ups! Something gone wrong",
            message: "Please, check your information.",
            preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }

    @objc func keyboardWillAppear() {
        keyboardIsPresent = true
    }

    @objc func keyboardWillDisappear() {
        keyboardIsPresent = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // swiftlint:disable notification_center_detachment
        NotificationCenter.default.removeObserver(self)
    }
}

extension AddTransactionViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        TransactionType.allCases.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        TransactionType.allCases[row].rawValue
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        transactionTypeInput.text = TransactionType.allCases[row].rawValue
        selectedTransactionType = TransactionType.allCases[row]
    }

}
