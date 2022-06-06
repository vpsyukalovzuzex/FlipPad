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
    
    var fps: Int {
        get {
            return Settings.fps
        }
        set {
            Settings.fps = newValue
            presenter?.didUpdateFps()
        }
    }
    
    var resolution: Int {
        get {
            return Settings.resolution
        }
        set {
            Settings.resolution = newValue
            presenter?.didUpdateResolution()
        }
    }
    
    var resolutions: [Resolution] {
        return Resolution.all
    }
    
    // MARK: -
    
    func start() {
        presenter?.didUpdateResolutions()
        presenter?.didUpdateResolution()
        presenter?.didUpdateFps()
    }
}
