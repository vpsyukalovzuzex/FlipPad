//
// LightboxSettingsView.swift
//

import UIKit
import Support

class LightboxSettingsView: UIViewController,
                            LightboxSettingsViewProtocol,
                            LightboxSettingsInputViewProtocol {
    
    // MARK: -
    
    @IBOutlet private weak var previousDrawingCaptionLabel: UILabel!
    @IBOutlet private weak var previousDrawingCountCaptionLabel: UILabel!
    @IBOutlet private weak var previousDrawingCountLabel: UILabel!
    @IBOutlet private weak var rangeOpacityCaptionLabel: UILabel!
    @IBOutlet private weak var alwaysDisplayCaptionLabel: UILabel!
    
    @IBOutlet private weak var previousDrawingCountSlider: UISlider!
    
    @IBOutlet private weak var rangeOpacityDoubleSlider: DoubleSlider!
    
    @IBOutlet private weak var alwaysDisplaySwitch: UISwitch!
    
    // MARK: - LightboxSettingsViewProtocol
    
    var presenter: LightboxSettingsOutputViewProtocol?
    
    // MARK: - LightboxSettingsInputViewProtocol
    
    var previousDrawingCount: Float {
        return previousDrawingCountSlider.value
    }
    
    var rangeOpacity: Range<Float> {
        return rangeOpacityDoubleSlider.range
    }
    
    var isAlwaysDisplayBackground: Bool {
        return alwaysDisplaySwitch.isOn
    }
    
    // MARK: -
    
    func setMinPreviousDrawingCountFloat(_ minPreviousDrawingCountFloat: Float) {
        previousDrawingCountSlider.minimumValue = minPreviousDrawingCountFloat
    }
    
    func setMaxPreviousDrawingCountFloat(_ maxPreviousDrawingCountFloat: Float) {
        previousDrawingCountSlider.maximumValue = maxPreviousDrawingCountFloat
    }
    
    func setPreviousDrawingCountFloat(_ previousDrawingCountFloat: Float) {
        previousDrawingCountSlider.value = previousDrawingCountFloat
    }
    
    func setPreviousDrawingCountString(_ previousDrawingCountString: String?) {
        previousDrawingCountLabel.text = previousDrawingCountString
    }
    
    func setRangeOpacity(_ rangeOpacity: Range<Float>) {
        rangeOpacityDoubleSlider.range = rangeOpacity
    }
    
    func setMinRangeOpacityString(_ minRangeOpacityString: String?) {
        rangeOpacityDoubleSlider.minValue = minRangeOpacityString
    }
    
    func setMaxRangeOpacityString(_ maxRangeOpacityString: String?) {
        rangeOpacityDoubleSlider.maxValue = maxRangeOpacityString
    }
    
    func setIsAlwaysDisplayBackground(_ isAlwaysDisplayBackground: Bool) {
        setIsAlwaysDisplayBackground(isAlwaysDisplayBackground, animated: true)
    }
    
    func setIsAlwaysDisplayBackground(_ isAlwaysDisplayBackground: Bool, animated: Bool) {
        if alwaysDisplaySwitch.isOn != isAlwaysDisplayBackground {
            alwaysDisplaySwitch.isOn = isAlwaysDisplayBackground
        }
    }
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        presenter?.viewDidLoad()
    }
    
    // MARK: -
    
    private func localize() {
        title = "Lightbox Settings".localized
        previousDrawingCaptionLabel.text = "Previous drawing in lightbox:".localized
        previousDrawingCountCaptionLabel.text = "Count:".localized
        rangeOpacityCaptionLabel.text = "Range opacity:".localized
        alwaysDisplayCaptionLabel.text = "Always display background:".localized
        rangeOpacityDoubleSlider.minCaption = "Min".localized
        rangeOpacityDoubleSlider.maxCaption = "Max".localized
    }
    
    // MARK: -
    
    @IBAction private func previousDrawingCountSliderAction(_ sender: UISlider) {
        presenter?.didChangePreviousDrawingCount()
    }
    
    @IBAction private func rangeOpacityDoubleSliderAction(_ sender: DoubleSlider) {
        presenter?.didChangeRangeOpacity()
    }
    
    @IBAction private func alwaysDisplaySwitchAction(_ sender: UISwitch) {
        presenter?.didChangeAlwaysDisplayBackground()
    }
}
