//
// ColorsOutputInteractorProtocol.swift
//

import Foundation
import Core

protocol ColorsOutputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    var palleteName: String? { get }
    
    // MARK: -
    
    func didUpdateColors(_ colors: [Color])
}
