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
        try URLManager.deleteFiles(at: [document.url])
        update()
    }
    
    // MARK: -
    
    private func update() {
        documents = URLManager.urls.compactMap { let d = try? Document(url: $0); d?.generateThumbnail { _ in self.update() }; return d }
        presenter?.didUpdateDocuments(documents)
    }
}
