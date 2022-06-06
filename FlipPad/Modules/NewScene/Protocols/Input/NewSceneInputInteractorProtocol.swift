//
// NewSceneInputInteractorProtocol.swift
//

import Foundation
import Core

protocol NewSceneInputInteractorProtocol: AnyObject {
    
    // Add input functions.
    
    // MARK: -
    
    var fps: Int { get set }
    
    var resolution: Int { get set }
    
    var resolutions: [Resolution] { get }
    
    // MARK: -
    
    func start()
}
