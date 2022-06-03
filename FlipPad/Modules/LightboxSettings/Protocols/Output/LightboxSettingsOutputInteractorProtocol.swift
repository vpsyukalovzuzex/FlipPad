//
// LightboxSettingsOutputInteractorProtocol.swift
//

import Foundation

protocol LightboxSettingsOutputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func didUpdateMinPreviuosDrawingCount(_ minPreviuosDrawingCount: Int)
    
    func didUpdateMaxPreviuosDrawingCount(_ maxPreviuosDrawingCount: Int)
    
    func didUpdatePreviuosDrawingCount(_ previuosDrawingCount: Int)
    
    func didUpdateRangeOpacity(_ rangeOpacity: Range<Float>)
    
    func didUpdateIsAlwaysDisplayBackground(_ isAlwaysDisplayBackground: Bool)
}
