//
//  ReminderViewController.swift
//  Today
//
//  Created by Florian Bruder on 21.03.22.
//

import Foundation
import UIKit

// MARK: -

class ReminderViewController: UICollectionViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Int, Row>

    var reminder: Reminder
    private var dataSource: DataSource!

    init(reminder: Reminder) {
        self.reminder = reminder

        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Always initialize ReminderViewController using init(reminder:)")
    }

    func test(for row: Row) -> String? {
        switch row {
        case .viewDate:
            return reminder.dueDate.dayText
        case .viewNotes:
            return reminder.notes
        case .viewTime:
            return reminder.dueDate.formatted(date: .omitted, time: .shortened)
        case .viewTitle:
            return reminder.title
        }
    }
}
