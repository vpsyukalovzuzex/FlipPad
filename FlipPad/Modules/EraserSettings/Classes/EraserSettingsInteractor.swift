//
// EraserSettingsInteractor.swift
//

import Foundation
import Core

class EraserSettingsInteractor: EraserSettingsInteractorProtocol,
                                EraserSettingsInputInteractorProtocol,
                                SettingsManagerDelegate {
    
    // MARK: - EraserSettingsInteractorProtocol
    
    weak var presenter: EraserSettingsOutputInteractorProtocol?
    
    // MARK: - EraserSettingsInputInteractorProtocol
    
    func start() {
        SettingsManager.addObserver(self)
        SettingsManager.setNeedsUpdate()
    }
    
    func setSize(_ size: Int) {
        Settings.eraserSize = size
        SettingsManager.setNeedsUpdate()
    }
    
    func setHardness(_ hardness: Int) {
        Settings.eraserHardness = hardness
        SettingsManager.setNeedsUpdate()
    }
    
    // MARK: -
    
    func didSetNeedsUpdateSettings() {
        presenter?.didUpdateMinSize(Settings.minEraserSize)
        presenter?.didUpdateMaxSize(Settings.maxEraserSize)
        presenter?.didUpdateSize(Settings.eraserSize)
        presenter?.didUpdateMinHardness(Settings.minEraserHardness)
        presenter?.didUpdateMaxHardness(Settings.maxEraserHardness)
        presenter?.didUpdateHardness(Settings.eraserHardness)
    }
}
