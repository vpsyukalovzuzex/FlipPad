//
// DocumentSettingsView.swift
//

import UIKit
import Support

class DocumentSettingsView: UIViewController,
                            DocumentSettingsViewProtocol,
                            DocumentSettingsInputViewProtocol {
    
    // MARK: -
    
    @IBOutlet private weak var resolutionCaptionLabel: UILabel!
    @IBOutlet private weak var resolutionLabel: UILabel!
    @IBOutlet private weak var playbackCaptionLabel: UILabel!
    @IBOutlet private weak var fpsCaptionLabel: UILabel!
    @IBOutlet private weak var fpsLabel: UILabel!
    
    @IBOutlet private weak var fpsSlider: UISlider!
    
    // MARK: - DocumentSettingsViewProtocol
    
    var presenter: DocumentSettingsOutputViewProtocol?
    
    // MARK: - DocumentSettingsInputViewProtocol
    
    var fps: Float {
        return fpsSlider.value
    }
    
    // MARK: -
    
    func setResolution(_ resolution: String?) {
        resolutionLabel.text = resolution
    }
    
    func setMinFpsFloat(_ minFpsFloat: Float) {
        fpsSlider.minimumValue = minFpsFloat
    }
    
    func setMaxFpsFloat(_ maxFpsFloat: Float) {
        fpsSlider.maximumValue = maxFpsFloat
    }
    
    func setFpsFloat(_ fpsFloat: Float) {
        fpsSlider.value = fpsFloat
    }
    
    func setFpsString(_ fpsString: String?) {
        fpsLabel.text = fpsString
    }
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        presenter?.viewDidLoad()
    }
    
    // MARK: -
    
    private func localize() {
        title = "Document Settings".localized
        resolutionCaptionLabel.text = "Resolution:".localized
        playbackCaptionLabel.text = "Playback speed:".localized
        fpsCaptionLabel.text = "FPS".localized
    }
    
    // MARK: -
    
    @IBAction func fpsSliderAction(_ sender: UISlider) {
        presenter?.didChangeFps()
    }
}
