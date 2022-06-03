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
    
    func renameDocument(at index: Int, with name: String) throws
    
    func duplicateDocument(at index: Int) throws
    
    func deleteDocument(at index: Int) throws
    
    func newDocument() throws
}
