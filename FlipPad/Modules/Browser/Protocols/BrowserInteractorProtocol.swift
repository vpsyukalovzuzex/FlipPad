//
// BrowserInteractorProtocol.swift
//

import Foundation

protocol BrowserInteractorProtocol: AnyObject {
    
    var presenter: BrowserOutputInteractorProtocol? { get set }
}
