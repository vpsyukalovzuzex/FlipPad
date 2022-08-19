//
// ToolsPresenterProtocol.swift
//

import Foundation

protocol ToolsPresenterProtocol: AnyObject {
    
    var view: ToolsInputViewProtocol? { get set }
    
    var interactor: ToolsInputInteractorProtocol? { get set }
    
    var router: ToolsInputRouterProtocol? { get set }
}
