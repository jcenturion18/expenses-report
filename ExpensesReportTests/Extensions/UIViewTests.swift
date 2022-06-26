//
//  UIViewTests.swift
//  ExpensesReportTests
//
//  Created by Julian Centurion on 25/06/2022.
//

import XCTest
@testable import ExpensesReport

class UIViewTests: XCTestCase {

    func testRoundedBorders() throws {
        let view = UIView()
        view.rondedView()

        XCTAssertTrue(view.clipsToBounds)
        XCTAssertEqual(.white, view.backgroundColor)
        XCTAssertEqual(6, view.layer.cornerRadius)
        XCTAssertEqual(1, view.layer.borderWidth)
        XCTAssertEqual(UIColor.black.cgColor, view.layer.borderColor)
    }
}
