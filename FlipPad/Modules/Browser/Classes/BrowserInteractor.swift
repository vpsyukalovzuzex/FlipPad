//
// BrowserInteractor.swift
//

import Foundation

class BrowserInteractor: BrowserInteractorProtocol,
                         BrowserInputInteractorProtocol {
    
    // MARK: - BrowserInteractorProtocol
    
    weak var presenter: BrowserOutputInteractorProtocol?
    
    // MARK: - BrowserInputInteractorProtocol
    
    // Implement protocol.
}
