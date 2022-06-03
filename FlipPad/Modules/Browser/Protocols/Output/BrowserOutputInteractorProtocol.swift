//
// BrowserOutputInteractorProtocol.swift
//

import Foundation
import Core

protocol BrowserOutputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func didUpdateDocuments(_ documents: [Document])
}
