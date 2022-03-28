//
//  TextViewContentView.swift
//  Today
//
//  Created by Florian Bruder on 27.03.22.
//

import UIKit

// MARK: -

class TextViewContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""
        var onChange: (String) -> Void = { _ in }

        func makeContentView() -> UIView & UIContentView {
            TextViewContentView(self)
        }
    }

    let textView = UITextView()
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(textView, hight: 200)
        textView.backgroundColor = nil
        textView.delegate = self
        textView.font = UIFont.preferredFont(forTextStyle: .body)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else {
            return
        }
        textView.text = configuration.text
    }
}

// MARK: -

extension UICollectionViewListCell {
    func textViewConfiguration() -> TextViewContentView.Configuration {
        TextViewContentView.Configuration()
    }
}

// MARK: -

extension TextViewContentView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        guard let configuration = configuration as? TextViewContentView.Configuration else {
            return
        }
        configuration.onChange(textView.text)
    }
}
