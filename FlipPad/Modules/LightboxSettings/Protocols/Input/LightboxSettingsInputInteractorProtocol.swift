//
// LightboxSettingsInputInteractorProtocol.swift
//

import Foundation

protocol LightboxSettingsInputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func start()
    
    func setPreviousDrawingCount(_ previousDrawingCount: Int)
    
    func setRangeOpacity(_ rangeOpacity: Range<Float>)
    
    func setIsAlwaysDisplayBackground(_ isAlwaysDisplayBackground: Bool)
}
