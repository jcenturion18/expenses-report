//
//  Float.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 25/06/2022.
//

import Foundation

extension Float {

    func normalize() -> Float {
        return max(0, min(1, self / 100 ))
    }
}
