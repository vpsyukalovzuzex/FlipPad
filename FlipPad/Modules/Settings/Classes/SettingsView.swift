//
// SettingsView.swift
//

import UIKit
import Support

class SettingsView: UIViewController,
                    SettingsViewProtocol,
                    SettingsInputViewProtocol {
    
    // MARK: -
    
    @IBOutlet private weak var versionCaptionLabel: UILabel!
    @IBOutlet private weak var versionLabel: UILabel!
    @IBOutlet private weak var buildNumberLabel: UILabel!
    @IBOutlet private weak var verticalToolbarCaptionLabel: UILabel!
    @IBOutlet private weak var xsheetPositionCaptionLabel: UILabel!
    
    @IBOutlet private weak var verticalToolbarsSwitch: UISwitch!
    
    @IBOutlet private weak var xsheetPositionSegmentedControl: UISegmentedControl!
    
    // MARK: - SettingsViewProtocol
    
    var presenter: SettingsOutputViewProtocol?
    
    // MARK: - SettingsInputViewProtocol
    
    var isVerticalToolbars: Bool {
        return verticalToolbarsSwitch.isOn
    }
    
    var xsheetPosition: Int {
        return xsheetPositionSegmentedControl.selectedSegmentIndex
    }
    
    // MARK: -
    
    func setVersion(_ version: String?) {
        versionLabel.text = version
    }
    
    func setBuildNumber(_ buildNumber: String?) {
        buildNumberLabel.text = buildNumber
    }
    
    func setIsVerticalToolbar(_ isVerticalToolbar: Bool) {
        setIsVerticalToolbar(isVerticalToolbar, animated: true)
    }
    
    func setIsVerticalToolbar(_ isVerticalToolbar: Bool, animated: Bool) {
        guard verticalToolbarsSwitch.isOn != isVerticalToolbar else {
            return
        }
        verticalToolbarsSwitch.setOn(isVerticalToolbar, animated: animated)
    }
    
    func setXsheetPosition(_ xsheetPosition: Int) {
        guard
            0 <= xsheetPosition && xsheetPosition < xsheetPositionSegmentedControl.numberOfSegments,
            xsheetPositionSegmentedControl.selectedSegmentIndex != xsheetPosition
        else {
            return
        }
        xsheetPositionSegmentedControl.selectedSegmentIndex = xsheetPosition
    }
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        presenter?.viewDidLoad()
    }
    
    // MARK: -
    
    private func localize() {
        title = "Settings".localized
        versionCaptionLabel.text = "Version:".localized
        verticalToolbarCaptionLabel.text = "Vertical toolbars:".localized
        xsheetPositionCaptionLabel.text = "Xsheet position:".localized
        xsheetPositionSegmentedControl.setTitle("Left".localized, forSegmentAt: 0)
        xsheetPositionSegmentedControl.setTitle("Right".localized, forSegmentAt: 1)
    }
    
    // MARK: -
    
    @IBAction private func verticalToolbarsSwitchAction(_ sender: UISwitch) {
        presenter?.didChangeIsVerticalToolbars()
    }
    
    @IBAction private func xsheetPositionSegmentedControlAction(_ sender: UISegmentedControl) {
        presenter?.didChangeXsheetPositionSegmentedControl()
    }
}
