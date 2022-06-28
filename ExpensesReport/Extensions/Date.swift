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
        dateFormater.locale = Locale(identifier: "en-US")
        dateFormater.dateFormat = formatedString()
        return dateFormater.string(from: self)
    }

    private func formatedString() -> String {
        return "d'\(self.daySuffix())' MMMM, yyyy"
    }

    private func daySuffix() -> String {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: self)
        let dayOfMonth = components.day
        switch dayOfMonth {
        case 1, 21, 31:
            return "st"
        case 2, 22:
            return "nd"
        case 3, 23:
            return "rd"
        default:
            return "th"
        }
    }
}
