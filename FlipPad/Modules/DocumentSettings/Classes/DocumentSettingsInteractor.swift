//
// DocumentSettingsInteractor.swift
//

import Foundation
import Core

class DocumentSettingsInteractor: DocumentSettingsInputInteractorProtocol,
                                  SettingsManagerDelegate {
    
    // MARK: - DocumentSettingsInteractorProtocol
    
    weak var presenter: DocumentSettingsOutputInteractorProtocol?
    
    // MARK: - DocumentSettingsInputInteractorProtocol
    
    func start() {
        SettingsManager.addObserver(self)
        SettingsManager.setNeedsUpdate()
        // TODO: -
        presenter?.didUpdateResolution(Resolution(width: 800, height: 600))
        presenter?.didUpdateFps(16)
    }
    
    func setFps(_ fps: Int) {
        // TODO: -
    }
    
    // MARK: -
    
    func didSetNeedsUpdateSettings() {
        presenter?.didUpdateMinFps(Settings.minFps)
        presenter?.didUpdateMaxFps(Settings.maxFps)
    }
}
