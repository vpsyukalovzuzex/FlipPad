//
// EraserSettingsView.swift
//

import UIKit

class EraserSettingsView: UIViewController,
                          EraserSettingsInputViewProtocol {
    
    // MARK: -
    
    @IBOutlet private weak var sizeCaptionLabel: UILabel!
    @IBOutlet private weak var hardnessCaptionLabel: UILabel!
    
    @IBOutlet private weak var sizeValueLabel: UILabel!
    @IBOutlet private weak var hardnessValueLabel: UILabel!
    
    @IBOutlet private weak var sizeSlider: UISlider!
    @IBOutlet private weak var hardnessSlider: UISlider!
    
    // MARK: - EraserSettingsViewProtocol
    
    var presenter: EraserSettingsOutputViewProtocol?
    
    // MARK: - EraserSettingsInputViewProtocol
    
    var size: Float {
        return sizeSlider.value
    }
    
    var hardness: Float {
        return hardnessSlider.value
    }
    
    // MARK: -
    
    func setMinSizeFloat(_ minSizeFloat: Float) {
        sizeSlider.minimumValue = minSizeFloat
    }
    
    func setMaxSizeFloat(_ maxSizeFloat: Float) {
        sizeSlider.maximumValue = maxSizeFloat
    }
    
    func setSizeFloat(_ sizeFloat: Float) {
        sizeSlider.value = sizeFloat
    }
    
    func setSizeString(_ sizeString: String) {
        sizeValueLabel.text = sizeString
    }
    
    func setMinHardnessFloat(_ minHardnessFloat: Float) {
        hardnessSlider.minimumValue = minHardnessFloat
    }
    
    func setMaxHardnessFloat(_ maxHardnessFloat: Float) {
        hardnessSlider.maximumValue = maxHardnessFloat
    }
    
    func setHardnessFloat(_ hardnessFloat: Float) {
        hardnessSlider.value = hardnessFloat
    }
    
    func setHardnessString(_ hardnessString: String) {
        hardnessValueLabel.text = hardnessString
    }
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK: -
    
    @IBAction func sizeSliderAction(_ sender: UISlider) {
        presenter?.didChangeSize()
    }
    
    @IBAction func hardnessSliderAction(_ sender: UISlider) {
        presenter?.didChangeHardness()
    }
}
