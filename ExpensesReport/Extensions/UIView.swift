//
//  UIView.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation
import UIKit

extension UIView {

    func rondedView() {
        backgroundColor = .white
        layer.cornerRadius = 6
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
}
