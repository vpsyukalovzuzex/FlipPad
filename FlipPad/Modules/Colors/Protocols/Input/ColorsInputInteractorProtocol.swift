//
// ColorsInputInteractorProtocol.swift
//

import Foundation
import Core

protocol ColorsInputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    var colors: [Color] { get }
    
    // MARK: -
    
    func start()
}
