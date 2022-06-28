//
//  DateTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 28/06/2022.
//

import XCTest
@testable import ExpensesReport

class DateTests: XCTestCase {

    func testParseDateFormat() throws {

        var date = "12/01/1990".toDate()

        XCTAssertEqual("12th January, 1990", date.toString())

        date = "1/01/1990".toDate()

        XCTAssertEqual("1st January, 1990", date.toString())

        date = "21/01/1990".toDate()

        XCTAssertEqual("21st January, 1990", date.toString())

        date = "23/01/1990".toDate()

        XCTAssertEqual("23rd January, 1990", date.toString())

        date = "2/01/1990".toDate()

        XCTAssertEqual("2nd January, 1990", date.toString())

        date = "3/01/1990".toDate()

        XCTAssertEqual("3rd January, 1990", date.toString())
    }
}
