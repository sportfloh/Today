//
//  TextFieldContentView.swift
//  Today
//
//  Created by Florian Bruder on 27.03.22.
//

import Foundation
import UIKit

// MARK: -

class TextFieldContentView: UIView {
    let textField = UITextField()

    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }

    init() {
        super.init(frame: .zero)
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        textField.clearButtonMode = .whileEditing
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
