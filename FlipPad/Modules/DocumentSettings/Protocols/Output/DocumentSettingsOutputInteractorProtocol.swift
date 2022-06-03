//
// DocumentSettingsOutputInteractorProtocol.swift
//

import Foundation
import Core

protocol DocumentSettingsOutputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func didUpdateResolution(_ resolution: Resolution)
    
    func didUpdateMinFps(_ minFps: Int)
    
    func didUpdateMaxFps(_ maxFps: Int)
    
    func didUpdateFps(_ fps: Int)
}
