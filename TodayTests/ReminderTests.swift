//
//  ReminderTests.swift
//  TodayTests
//
//  Created by Florian Bruder on 12.02.22.
//

@testable import Today
import XCTest

// MARK: -

final class ReminderTestCase: XCTestCase {}

// MARK: -

extension ReminderTestCase {
    func testAllProperties() {
        let title = "TestTitle"
        let dueDate = Date()
        let notes = "Test notes"
        let isComplete = true

        let reminder = Reminder(
            title: title,
            dueDate: dueDate,
            notes: notes,
            isComplete: isComplete)

        XCTAssertEqual(title, reminder.title)
        XCTAssertEqual(dueDate, reminder.dueDate)
        XCTAssertNotNil(reminder.notes)
        XCTAssertEqual(notes, reminder.notes)
        XCTAssertEqual(isComplete, reminder.isComplete)
    }

    func testIndexOfReminder() {
        let index = 2
        let reminder = Reminder.sampleData[index]

        XCTAssertEqual(index, Reminder.sampleData.indexOfReminder(with: reminder.id))
    }
}
