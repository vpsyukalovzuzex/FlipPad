//
// ToolsPresenter.swift
//

import Foundation

class ToolsPresenter: ToolsOutputViewProtocol,
                      ToolsOutputInteractorProtocol {
    
    // MARK: - ToolsPresenterProtocol
    
    weak var view: ToolsInputViewProtocol?
    
    var interactor: ToolsInputInteractorProtocol?
    
    var router: ToolsInputRouterProtocol?
    
    // MARK: - ToolsOutputViewProtocol
    
    // Implement protocol.
    
    // MARK: - ToolsOutputInteractorProtocol
    
    // Implement protocol.
}
