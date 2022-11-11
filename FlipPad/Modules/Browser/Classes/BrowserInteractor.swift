//
// BrowserInteractor.swift
//

import Foundation
import Core

class BrowserInteractor: BrowserInputInteractorProtocol {
    
    // MARK: -
    
    var documents = [Document]()
    
    // MARK: -
    
    private var filesObserver = FilesObserver(url: FilesManager.folder)
    
    // MARK: - BrowserInteractorProtocol
    
    weak var presenter: BrowserOutputInteractorProtocol?
    
    // MARK: - BrowserInputInteractorProtocol
    
    func start() {
        update()
        filesObserver.start { [weak self] in
            self?.update()
        }
    }
    
    func renameDocument(at index: Int, with name: String) throws {
        guard let document = documents[safe: index] else {
            return
        }
        try FilesManager.renameFile(at: document.url, with: name)
        update()
    }
    
    func duplicateDocument(at index: Int) throws {
        guard let document = documents[safe: index] else {
            return
        }
        try FilesManager.duplicateFile(at: document.url)
        update()
    }
    
    func deleteDocument(at index: Int) throws {
        guard let document = documents[safe: index] else {
            return
        }
        try FilesManager.deleteFiles(at: [document.url])
        update()
    }
    
    func exportDocument(at index: Int) throws {
        // TODO: -
    }
    
    func newDocument() throws {
        // TODO: -
        update()
    }
    
    // MARK: -
    
    private func update() {
        documents = FilesManager.documentsUrls.compactMap { try? Document(url: $0) }
        for document in documents {
            document.generateThumbnail { [weak self] _ in
                guard let self = self else {
                    return
                }
                self.presenter?.didUpdateDocuments(self.documents)
            }
        }
        presenter?.didUpdateDocuments(documents)
    }
    
    // MARK: -
    
    deinit {
        filesObserver.stop()
    }
}
