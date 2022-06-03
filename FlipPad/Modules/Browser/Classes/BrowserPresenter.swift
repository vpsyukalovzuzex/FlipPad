//
// BrowserPresenter.swift
//

import Foundation

class BrowserPresenter: BrowserPresenterProtocol,
                        BrowserOutputViewProtocol,
                        BrowserOutputInteractorProtocol {
    
    // MARK: - BrowserPresenterProtocol
    
    weak var view: BrowserInputViewProtocol?
    
    var interactor: BrowserInputInteractorProtocol?
    
    var router: BrowserInputRouterProtocol?
    
    // MARK: - BrowserOutputViewProtocol
    
    func didSelectNewScene() {
        // TODO: -
    }
    
    func didSelectImport() {
        // TODO: -
    }
    
    func didSelectRename() {
        // TODO: -
    }
    
    func didSelectDuplicate() {
        // TODO: -
    }
    
    func didSelectDelete() {
        // TODO: -
    }
    
    func didSelectExport() {
        // TODO: -
    }
    
    func didSelectDocument() {
        // TODO: -
    }
    
    // MARK: - BrowserOutputInteractorProtocol
    
    // Implement protocol.
}
