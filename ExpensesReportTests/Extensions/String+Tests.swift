//
//  String+Tests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 30/06/2022.
//

import Foundation

extension String {

    func toDate() -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        return dateFormater.date(from: self)!
    }
}
