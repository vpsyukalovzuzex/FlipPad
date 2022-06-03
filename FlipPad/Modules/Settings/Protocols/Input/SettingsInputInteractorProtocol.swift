//
// SettingsInputInteractorProtocol.swift
//

import Foundation

protocol SettingsInputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func start()
    
    func setIsVerticalToolbars(_ isVerticalToolbars: Bool)
    
    func setXsheetPosition(_ xsheetPosition: Int)
}
