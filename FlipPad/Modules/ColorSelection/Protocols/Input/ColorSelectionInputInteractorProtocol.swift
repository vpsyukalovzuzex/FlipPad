//
// ColorSelectionInputInteractorProtocol.swift
//

import Foundation
import Core

protocol ColorSelectionInputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func start()
    
    func setColor(_ color: Color)
    
    func setOpacity(_ opacity: Float)
    
    func addNewColor(_ color: Color) throws
}
