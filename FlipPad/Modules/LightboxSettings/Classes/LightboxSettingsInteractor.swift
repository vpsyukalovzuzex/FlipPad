//
// LightboxSettingsInteractor.swift
//

import Foundation
import Core

class LightboxSettingsInteractor: LightboxSettingsInteractorProtocol,
                                  LightboxSettingsInputInteractorProtocol,
                                  SettingsManagerDelegate {
    
    // MARK: - LightboxSettingsInteractorProtocol
    
    weak var presenter: LightboxSettingsOutputInteractorProtocol?
    
    // MARK: - LightboxSettingsInputInteractorProtocol
    
    func start() {
        SettingsManager.addObserver(self)
        SettingsManager.setNeedsUpdate()
    }
    
    func setPreviousDrawingCount(_ previousDrawingCount: Int) {
        Settings.previousDrawingCount = previousDrawingCount
        SettingsManager.setNeedsUpdate()
    }
    
    func  setRangeOpacity(_ rangeOpacity: Range<Float>) {
        Settings.minOpacity = rangeOpacity.lowerBound
        Settings.maxOpacity = rangeOpacity.upperBound
        SettingsManager.setNeedsUpdate()
    }
    
    func setIsAlwaysDisplayBackground(_ isAlwaysDisplayBackground: Bool) {
        Settings.isAlwaysDisplayBackground = isAlwaysDisplayBackground
        SettingsManager.setNeedsUpdate()
    }
    
    // MARK: -
    
    func didSetNeedsUpdateSettings() {
        presenter?.didUpdateMinPreviuosDrawingCount(Settings.minPreviousDrawingCount)
        presenter?.didUpdateMaxPreviuosDrawingCount(Settings.maxPreviousDrawingCount)
        presenter?.didUpdatePreviuosDrawingCount(Settings.previousDrawingCount)
        presenter?.didUpdateRangeOpacity(Settings.minOpacity..<Settings.maxOpacity)
        presenter?.didUpdateIsAlwaysDisplayBackground(Settings.isAlwaysDisplayBackground)
    }
}
