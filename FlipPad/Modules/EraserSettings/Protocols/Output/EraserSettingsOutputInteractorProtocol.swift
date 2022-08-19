//
// EraserSettingsOutputInteractorProtocol.swift
//

import Foundation

protocol EraserSettingsOutputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func didUpdateMinSize(_ minSize: Int)
    
    func didUpdateMaxSize(_ maxSize: Int)
    
    func didUpdateSize(_ size: Int)
    
    func didUpdateMinHardness(_ minHardness: Int)
    
    func didUpdateMaxHardness(_ maxHardness: Int)
    
    func didUpdateHardness(_ hardness: Int)
}
