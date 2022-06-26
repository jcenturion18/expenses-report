//
//  Date.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 26/06/2022.
//

import Foundation

extension Date {

    func toString() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd,MM,yyyy"
        return dateFormater.string(from: self)
    }
}
