//
// DoubleSlider.swift
//

import UIKit

class DoubleSlider: XibView {
    
    // MARK: -
    
    @IBOutlet private var minCaptionLabel: UILabel!
    @IBOutlet private var maxCaptionLabel: UILabel!
    
    @IBOutlet private var minSlider: UISlider!
    @IBOutlet private var maxSlider: UISlider!
    
    @IBOutlet private var minValueLabel: UILabel!
    @IBOutlet private var maxValueLabel: UILabel!
    
    // MARK: -
    
    var minCaption: String? {
        get {
            return minCaptionLabel.text
        }
        set {
            minCaptionLabel.text = newValue
        }
    }
    
    var maxCaption: String? {
        get {
            return maxCaptionLabel.text
        }
        set {
            maxCaptionLabel.text = newValue
        }
    }
    
    var range: Range<Float> {
        get {
            if minSlider.value <= maxSlider.value {
                return (minSlider.value..<maxSlider.value)
            }
            return (0.0..<0.0)
        }
        set {
            minSlider.value = newValue.lowerBound
            maxSlider.value = newValue.upperBound
        }
    }
    
    var minValue: String? {
        get {
            return minValueLabel.text
        }
        set {
            minValueLabel.text = newValue
        }
    }
    
    var maxValue: String? {
        get {
            return maxValueLabel.text
        }
        set {
            maxValueLabel.text = newValue
        }
    }
    
    var minimumValue: Float {
        get {
            return minSlider.minimumValue
        }
        set {
            minSlider.minimumValue = newValue
            maxSlider.minimumValue = newValue
        }
    }
    
    var maximumValue: Float {
        get {
            return minSlider.maximumValue
        }
        set {
            minSlider.maximumValue = newValue
            maxSlider.maximumValue = newValue
        }
    }
    
    // MARK: -
    
    override func didLoad() {
        super.didLoad()
        clipsToBounds = false
    }
    
    // MARK: -
    
    @IBAction private func minSliderAction(_ sender: UISlider) {
        if sender.value > maxSlider.value {
            maxSlider.value = sender.value
        }
        sendActions(for: .valueChanged)
    }
    
    @IBAction private func maxSliderAction(_ sender: UISlider) {
        if sender.value < minSlider.value {
            minSlider.value = sender.value
        }
        sendActions(for: .valueChanged)
    }
}
