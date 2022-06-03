//
// LightboxSettingsInputViewProtocol.swift
//

import Foundation

protocol LightboxSettingsInputViewProtocol: AnyObject {
    
    // MARK: -
    
    var previousDrawingCount: Float { get }
    
    var rangeOpacity: Range<Float> { get }
    
    var isAlwaysDisplayBackground: Bool { get }
    
    // MARK: -
        
    func setMinPreviousDrawingCountFloat(_ minPreviousDrawingCountFloat: Float)
    
    func setMaxPreviousDrawingCountFloat(_ maxPreviousDrawingCountFloat: Float)
    
    func setPreviousDrawingCountFloat(_ previousDrawingCountFloat: Float)
    
    func setPreviousDrawingCountString(_ previousDrawingCountString: String?)
    
    func setRangeOpacity(_ rangeOpacity: Range<Float>)
    
    func setMinRangeOpacityString(_ minRangeOpacityString: String?)
    
    func setMaxRangeOpacityString(_ maxRangeOpacityString: String?)
    
    func setIsAlwaysDisplayBackground(_ isAlwaysDisplayBackground: Bool)
    func setIsAlwaysDisplayBackground(_ isAlwaysDisplayBackground: Bool, animated: Bool)
}
