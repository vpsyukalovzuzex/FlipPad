//
// XibView.swift
//

import UIKit

public class XibView: UIControl {
    
    // MARK: -
    
    public private(set) var contentView: UIView?
    
    // MARK: -
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        didLoad()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        didLoad()
    }
    
    // MARK: -
    
    public func didLoad() {
        // Empty.
    }
    
    // MARK: -
    
    private func setup() {
        guard
            let name = NSStringFromClass(type(of: self)).components(separatedBy: ".").last,
            let contentView = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView
        else {
            return
        }
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
        self.contentView = contentView
    }
}
