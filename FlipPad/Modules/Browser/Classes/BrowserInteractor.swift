//
// BrowserInteractor.swift
//

import Foundation
import Core

class BrowserInteractor: BrowserInteractorProtocol,
                         BrowserInputInteractorProtocol {
    
    // MARK: -
    
    var documents = [Document]()
    
    // MARK: - BrowserInteractorProtocol
    
    weak var presenter: BrowserOutputInteractorProtocol?
    
    // MARK: - BrowserInputInteractorProtocol
    
    func start() {
        update()
    }
    
    func deleteDocument(at index: Int) throws {
        guard let document = documents[safe: index] else {
            return
        }
        try UrlManager.deleteFiles(at: [document.url])
        update()
    }
    
    // MARK: -
    
    private func update() {
        documents = UrlManager.urls.map { Document(url: $0) }
        presenter?.didUpdateDocuments(documents)
    }
}
