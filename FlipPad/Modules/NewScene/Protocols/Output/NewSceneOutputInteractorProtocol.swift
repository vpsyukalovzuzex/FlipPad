//
// NewSceneOutputInteractorProtocol.swift
//

import Foundation
import Core

protocol NewSceneOutputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func didUpdateAllResolutions(_ allResolutions: [Resolution])
    
    func didUpdateFps(_ fps: Int)
    
    func didUpdateResolution(_ resolution: Int)
}
