//
// DocumentSettingsInputViewProtocol.swift
//

import Foundation

protocol DocumentSettingsInputViewProtocol: UIAlertControllerProtocol {
    
    // MARK: -
    
    var fps: Float { get }
    
    // MARK: -
    
    func setResolution(_ resolution: String?)
    
    func setMinFpsFloat(_ minFpsFloat: Float)
    
    func setMaxFpsFloat(_ maxFpsFloat: Float)
    
    func setFpsFloat(_ fpsFloat: Float)
    
    func setFpsString(_ fpsString: String?)
}
