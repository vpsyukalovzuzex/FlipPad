//
// LongPressButton.swift
//

import UIKit

class LongPressButton: UIControl {
    
    // MARK: -
    
    var minimumPressDuration: CGFloat = 0.8
    
    // MARK: -
    
    private(set) var isLongPress = false
    
    // MARK: -
    
    private var displayLink: CADisplayLink?
    
    private var time: CFTimeInterval = 0.0
    
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
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        isLongPress = false
        time = 0.0
        return true
    }
    
    // MARK: -
    
    private func setup() {
        displayLink = CADisplayLink(
            target: self,
            selector: #selector(displayLinkAction)
        )
        displayLink?.add(to: .main, forMode: .common)
    }
    
    // MARK: -
    
    @objc private func displayLinkAction() {
        guard isTracking else {
            return
        }
        time += displayLink?.duration ?? 0.0
        isLongPress = minimumPressDuration <= time
        if minimumPressDuration <= time {
            endTracking(nil, with: nil)
            sendActions(for: .touchUpInside)
        }
    }
    
    // MARK: -
    
    deinit {
        displayLink?.invalidate()
        displayLink = nil
    }
}
