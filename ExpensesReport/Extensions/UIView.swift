//
//  UIView.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation
import UIKit

extension UIView {

    func roundedView() {
        backgroundColor = .white
        layer.cornerRadius = 6
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    func circularView() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true

        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
}
