//
//  CAGradientLayer+ListStyle.swift
//  Today
//
//  Created by Florian Bruder on 24.04.22.
//

import UIKit

// MARK: -

extension CAGradientLayer {
    static func gradiantLayer(for style: ReminderListStyle, in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }

    private static func colors(for style: ReminderListStyle) -> [CGColor] {
        let beginColor: UIColor
        let endColor: UIColor

        switch style {
        case .today:
            beginColor = .todayGradientAllBegin
            endColor = .todayGradientAllEnd
        case .future:
            beginColor = .todayGradientFutureBegin
            endColor = .todayGradientFutureEnd
        case .all:
            beginColor = .todayGradientTodayBegin
            endColor = .todayGradientTodayEnd
        }

        return [beginColor.cgColor, endColor.cgColor]
    }
}
