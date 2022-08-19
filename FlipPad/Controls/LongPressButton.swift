//
// LongPressButton.swift
//

import UIKit
import CoreGraphics

class LongPressButton: UIControl {
    
    // MARK: -
    
    var minimumPressDuration: CGFloat = 2.0
    
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
        // TODO: -
        return true
    }
    
    override func endEditing(_ force: Bool) -> Bool {
        // TODO: -
        
        return true
    }
    
    // MARK: -
    
    private func setup() {
        displayLink = CADisplayLink(
            target: self,
            selector: #selector(displayLinkAction)
        )
    }
    
    // MARK: -
    
    @objc private func displayLinkAction() {
        if isTracking {
            time += displayLink?.timestamp ?? 0.0
            print(time)
        }
    }
    
    // MARK: -
    
    deinit {
        displayLink?.invalidate()
        displayLink = nil
    }
}
