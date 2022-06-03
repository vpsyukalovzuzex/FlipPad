//
// NewSceneInputInteractorProtocol.swift
//

import Foundation
import Core

protocol NewSceneInputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func start()
    
    func setFps(_ fps: Int)
    
    func setResolution(_ resolution: Int)
}
