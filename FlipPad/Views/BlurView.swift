//
// BlurView.swift
//

import UIKit

class BlurView: UIView {
    
    // MARK: -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: -
    
    private func setup() {
        backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(visualEffectView, at: 0)
        addConstraint(
            NSLayoutConstraint(
                item: visualEffectView,
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
                toItem: visualEffectView,
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
                toItem: visualEffectView,
                attribute: .bottom,
                multiplier: 1.0,
                constant: 0.0
            )
        )
        addConstraint(
            NSLayoutConstraint(
                item: visualEffectView,
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
