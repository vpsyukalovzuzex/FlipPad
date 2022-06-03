//
// XibView.swift
//

import UIKit

class XibView: UIControl {
    
    // MARK: -
    
    private let contentView: UIView
    
    // MARK: -
    
    private static func loadNib() -> UIView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: self)?.first as? UIView ?? UIView()
    }
    
    // MARK: -
    
    override init(frame: CGRect) {
        self.contentView = XibView.loadNib()
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder: NSCoder) {
        self.contentView = XibView.loadNib()
        super.init(coder: coder)
        didLoad()
    }
    
    // MARK: -
    
    func didLoad() {
        translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        addConstraint(
            NSLayoutConstraint(
                item: contentView,
                attribute: .top,
                relatedBy: .equal,
                toItem: self,
                attribute: .top,
                multiplier: 1.0,
                constant: 0.0
            )
        )
        addConstraint(
            NSLayoutConstraint(
                item: self,
                attribute: .right,
                relatedBy: .equal,
                toItem: contentView,
                attribute: .right,
                multiplier: 1.0,
                constant: 0.0
            )
        )
        addConstraint(
            NSLayoutConstraint(
                item: self,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: contentView,
                attribute: .bottom,
                multiplier: 1.0,
                constant: 0.0
            )
        )
        addConstraint(
            NSLayoutConstraint(
                item: contentView,
                attribute: .left,
                relatedBy: .equal,
                toItem: self,
                attribute: .left,
                multiplier: 1.0,
                constant: 0.0
            )
        )
    }
}
