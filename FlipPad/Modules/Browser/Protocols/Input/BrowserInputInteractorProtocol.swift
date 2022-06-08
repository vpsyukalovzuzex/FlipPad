//
// BrowserInputInteractorProtocol.swift
//

import Foundation
import Core

protocol BrowserInputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    var documents: [Document] { get }
    
    // MARK: -
    
    func start()
    
    func deleteDocument(at index: Int) throws
}
