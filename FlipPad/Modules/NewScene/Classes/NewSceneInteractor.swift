//
// NewSceneInteractor.swift
//

import Foundation
import Core

class NewSceneInteractor: NewSceneInputInteractorProtocol,
                          SettingsManagerDelegate {
    
    // MARK: - NewSceneInteractorProtocol
    
    weak var presenter: NewSceneOutputInteractorProtocol?
    
    // MARK: - NewSceneInputInteractorProtocol
    
    func start() {
        presenter?.didUpdateAllResolutions(Resolution.all)
        SettingsManager.addObserver(self)
        SettingsManager.setNeedsUpdate()
    }
    
    func setFps(_ fps: Int) {
        Settings.fps = fps
        SettingsManager.setNeedsUpdate()
    }
    
    func setResolution(_ resolution: Int) {
        Settings.resolution = resolution
        SettingsManager.setNeedsUpdate()
    }
    
    // MARK: -
    
    func didSetNeedsUpdateSettings() {
        presenter?.didUpdateFps(Settings.fps)
        presenter?.didUpdateMinFps(Settings.minFps)
        presenter?.didUpdateMaxFps(Settings.maxFps)
        presenter?.didUpdateResolution(Settings.resolution)
    }
}
