//
//  ReminderListStyle.swift
//  Today
//
//  Created by Florian Bruder on 03.04.22.
//

import Foundation

// MARK: -

enum ReminderListStyle: Int {
    case today
    case future
    case all

    func shouldInclude(date: Date) -> Bool {
        let isInToday = Locale.current.calendar.isDateInToday(date)
        switch self {
        case .today:
            return isInToday
        case .future:
            return (date > Date.now) && !isInToday
        case .all:
            return true
        }
    }
}
