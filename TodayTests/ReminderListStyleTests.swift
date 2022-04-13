//
//  ReminderListStyleTests.swift
//  TodayTests
//
//  Created by Florian Bruder on 03.04.22.
//

@testable import Today
import XCTest

// MARK: -

final class ReminderListStyleTestCase: XCTestCase {
    func testShouldIncludeTodayToday() {
        let reminderListStyle = ReminderListStyle.today
        XCTAssert(reminderListStyle.shouldInclude(date: Date.now))
        XCTAssertFalse(reminderListStyle.shouldInclude(date: Calendar.current.date(
            byAdding: .day,
            value: -1,
            to: Date.now)!))
        XCTAssertFalse(reminderListStyle.shouldInclude(date: Calendar.current.date(
            byAdding: .day,
            value: 1,
            to: Date.now)!))
    }

    func testShouldIncludeTodayFuture() {
        let reminderListStyle = ReminderListStyle.future
        XCTAssert(
            reminderListStyle.shouldInclude(date: Calendar.current.date(
                byAdding: .day,
                value: 1,
                to: Date.now)!))
        XCTAssertFalse(reminderListStyle.shouldInclude(date: Date.now))
    }

    func testShouldIncludeTodayAll() {
        let reminderListStyle = ReminderListStyle.all
        XCTAssert(reminderListStyle.shouldInclude(date: Date.now))
        XCTAssert(reminderListStyle.shouldInclude(
            date: Calendar.current.date(
                byAdding: .day,
                value: -1,
                to: Date.now)!))
        XCTAssert(reminderListStyle.shouldInclude(
            date: Calendar.current.date(
                byAdding: .day,
                value: 1,
                to: Date.now)!))
    }

    func testNameProperty() {
        var reminderListStyle = ReminderListStyle.today
        XCTAssertEqual(reminderListStyle.name, "Today")
        reminderListStyle = .future
        XCTAssertEqual(reminderListStyle.name, "Future")
        reminderListStyle = .all
        XCTAssertEqual(reminderListStyle.name, "All")
    }
}
