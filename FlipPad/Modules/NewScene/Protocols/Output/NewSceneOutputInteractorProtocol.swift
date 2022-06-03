//
// NewSceneOutputInteractorProtocol.swift
//

import Foundation
import Core

protocol NewSceneOutputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func didUpdateAllResolutions(_ allResolutions: [Resolution])
    
    func didUpdateFps(_ fps: Int)
    
    func didUpdateMinFps(_ minFps: Int)
    func didUpdateMaxFps(_ maxFps: Int)
    
    func didUpdateResolution(_ resolution: Int)
}
