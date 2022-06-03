//
// ColorSelectionOutputInteractorProtocol.swift
//

import Foundation
import Core

protocol ColorSelectionOutputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    var palleteName: String? { get }
    
    // MARK: -
    
    func didUpdateColor(_ color: Color)
    
    func didUpdateOpacity(_ opacity: Float)
}
