//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Florian Bruder on 14.03.22.
//

import Foundation

// MARK: -

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else {
            return
        }
        completeReminder(with: id)
    }
}
