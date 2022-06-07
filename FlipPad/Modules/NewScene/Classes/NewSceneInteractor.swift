//
// NewSceneInteractor.swift
//

import Foundation
import Core

class NewSceneInteractor: NewSceneInteractorProtocol,
                          NewSceneInputInteractorProtocol {
    
    // MARK: - NewSceneInteractorProtocol
    
    weak var presenter: NewSceneOutputInteractorProtocol?
    
    // MARK: - NewSceneInputInteractorProtocol
    
    func start() {
        presenter?.didUpdateAllResolutions(Resolution.all)
        presenter?.didUpdateFps(Settings.fps)
        presenter?.didUpdateResolution(Settings.resolution)
    }
    
    func setFps(_ fps: Int) {
        Settings.fps = fps
        presenter?.didUpdateFps(fps)
    }
    
    func setResolution(_ resolution: Int) {
        Settings.resolution = resolution
        presenter?.didUpdateResolution(resolution)
    }
}
