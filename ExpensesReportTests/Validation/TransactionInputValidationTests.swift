//
//  TransactionInputValidationTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 28/06/2022.
//

import XCTest
@testable import ExpensesReport

class TransactionInputValidationTests: XCTestCase {

    func testInvalidCases() throws {

        var result = TransactionInputValidation.validateInput(amount: nil,
                                                              description: nil,
                                                              transactionType: nil)

        XCTAssertFalse(result.0)
        XCTAssertNil(result.1)

        result = TransactionInputValidation.validateInput(amount: "nil",
                                                          description: nil,
                                                          transactionType: nil)

        XCTAssertFalse(result.0)
        XCTAssertNil(result.1)

        result = TransactionInputValidation.validateInput(amount: "123",
                                                          description: nil,
                                                          transactionType: nil)

        XCTAssertFalse(result.0)
        XCTAssertNil(result.1)

        result = TransactionInputValidation.validateInput(amount: "0",
                                                          description: nil,
                                                          transactionType: nil)

        XCTAssertFalse(result.0)
        XCTAssertNil(result.1)

        result = TransactionInputValidation.validateInput(amount: "123",
                                                          description: "",
                                                          transactionType: nil)

        XCTAssertFalse(result.0)
        XCTAssertNil(result.1)

        result = TransactionInputValidation.validateInput(amount: "123",
                                                          description: "Valid text",
                                                          transactionType: nil)

        XCTAssertFalse(result.0)
        XCTAssertNil(result.1)
    }

    func testValidCases() throws {

        let result = TransactionInputValidation.validateInput(amount: "123",
                                                              description: "Valid",
                                                              transactionType: .income)

        XCTAssertTrue(result.0)
        XCTAssertNotNil(result.1)
    }

}
