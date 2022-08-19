//
// EraserSettingsInputViewProtocol.swift
//

import Foundation

protocol EraserSettingsInputViewProtocol: UIAlertControllerProtocol {
    
    // MARK: -
    
    var size: Float { get }
    
    var hardness: Float { get }
    
    // MARK: -
    
    func setMinSizeFloat(_ minSizeFloat: Float)
    
    func setMaxSizeFloat(_ maxSizeFloat: Float)
    
    func setSizeFloat(_ sizeFloat: Float)
    
    func setSizeString(_ sizeString: String)
    
    func setMinHardnessFloat(_ minHardnessFloat: Float)
    
    func setMaxHardnessFloat(_ maxHardnessFloat: Float)
    
    func setHardnessFloat(_ hardnessFloat: Float)
    
    func setHardnessString(_ hardnessString: String)
}
