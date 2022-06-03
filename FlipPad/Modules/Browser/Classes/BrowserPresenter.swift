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
    
    // Implement protocol.
    
    // MARK: - BrowserOutputInteractorProtocol
    
    // Implement protocol.
}
