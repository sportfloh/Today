//
//  TodayError.swift
//  Today
//
//  Created by Florian Bruder on 01.05.22.
//

import Foundation

// MARK: -

enum TodayError: LocalizedError {
    case failedReadingReminders

    var errorDescription: String? {
        switch self {
        case .failedReadingReminders:
            return NSLocalizedString("Failed to read reminders.", comment: "failed reading reminders error description")
        }
    }
}
