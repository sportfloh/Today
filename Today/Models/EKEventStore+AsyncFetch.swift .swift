//
//  EKEventStore+AsyncFetch.swift .swift
//  Today
//
//  Created by Florian Bruder on 01.05.22.
//

import EventKit
import Foundation

// MARK: -

extension EKEventStore {
    func fetchReminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders = reminders {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        }
    }
}
