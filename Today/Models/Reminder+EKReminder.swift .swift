// G
//  Reminder+EKReminder.swift .swift
//  Today
//
//  Created by Florian Bruder on 01.05.22.
//

import EventKit
import Foundation

// MARK: -

extension Reminder {
    init(with ekReminder: EKReminder) throws {
        guard let dueDate = ekReminder.alarms?.first?.absoluteDate else {
            throw TodayError.reminderHasNoDueDate
        }
        id = ekReminder.calendarItemExternalIdentifier
        title = ekReminder.title
        self.dueDate = dueDate
        notes = ekReminder.notes
        isComplete = ekReminder.isCompleted
    }
}
