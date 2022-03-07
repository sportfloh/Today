//
//  Date+TodayTests.swift
//  TodayTests
//
//  Created by Florian Bruder on 07.03.22.
//

import Foundation
@testable import Today
import XCTest

// MARK: -

// swiftlint:disable type_name
final class Date_TodayTestCase: XCTestCase {
    // MARK: - test property dayAndTime

    func testDayAndTimeTextToday() {
        let timeText = Date().formatted(date: .omitted, time: .shortened)
        let timeFormat = NSLocalizedString(
            "Today at %@",
            comment: "Today at time format string")

        XCTAssertEqual(
            String(format: timeFormat, timeText),
            Date().dayAndTimeText)
    }

    func testDayAndTimeTextNotToday() {
        let seconds: TimeInterval = 2000
        let dateText = Date(timeIntervalSince1970: seconds)
            .formatted(.dateTime.month(.abbreviated).day())
        let timeText = Date(timeIntervalSince1970: seconds)
            .formatted(date: .omitted, time: .shortened)
        let dateAndTimeFormat = NSLocalizedString(
            "%@ at %@",
            comment: "Date and time format string")

        XCTAssertEqual(
            String(
                format: dateAndTimeFormat,
                dateText, timeText),
            Date(timeIntervalSince1970: seconds).dayAndTimeText)
    }

    // MARK: - test property dayAndTime
}
