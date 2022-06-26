//
//  FloatTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 25/06/2022.
//

import XCTest
@testable import ExpensesReport

class FloatTests: XCTestCase {

    func testNormalize() throws {

        var value: Float = -2

        XCTAssertEqual(0, value.normalize())

        value = 100

        XCTAssertEqual(1, value.normalize())

        value = 50
        XCTAssertEqual(0.5, value.normalize())

        value = 500
        XCTAssertEqual(1, value.normalize())
    }
}
