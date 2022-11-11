//
// SettingsInteractor.swift
//

import Foundation
import Support
import Core

class SettingsInteractor: SettingsInputInteractorProtocol,
                          SettingsManagerDelegate {
    
    // MARK: - SettingsInteractorProtocol
    
    weak var presenter: SettingsOutputInteractorProtocol?
    
    // MARK: - SettingsInputInteractorProtocol
    
    func start() {
        presenter?.didUpdateVersion(.version)
        presenter?.didUpdateBuildNumber(.buildNumber)
        SettingsManager.addObserver(self)
        SettingsManager.setNeedsUpdate()
    }
    
    func setIsVerticalToolbars(_ isVerticalToolbars: Bool) {
        Settings.isVerticalToolbars = isVerticalToolbars
        SettingsManager.setNeedsUpdate()
    }
    
    func setXsheetPosition(_ xsheetPosition: Int) {
        Settings.xsheetPosition = xsheetPosition
        SettingsManager.setNeedsUpdate()
    }
    
    // MARK: -
    
    func didSetNeedsUpdateSettings() {
        presenter?.didUpdateIsVerticalToolbars(Settings.isVerticalToolbars)
        presenter?.didUpdateXsheetPosition(Settings.xsheetPosition)
    }
}
