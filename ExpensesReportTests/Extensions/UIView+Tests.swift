//
//  UIView+Tests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 28/06/2022.
//

import UIKit

extension UIView {

    static func loadNib() -> Self {
        // swiftlint:disable force_cast
        Bundle.main.loadNibNamed("\(Self.self)", owner: nil, options: nil)?.first as! Self
        // swiftlint:enable force_cast
    }
}
