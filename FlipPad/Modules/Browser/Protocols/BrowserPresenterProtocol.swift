//
// BrowserPresenterProtocol.swift
//

import Foundation

protocol BrowserPresenterProtocol: AnyObject {
    
    var view: BrowserInputViewProtocol? { get set }
    
    var interactor: BrowserInputInteractorProtocol? { get set }
    
    var router: BrowserInputRouterProtocol? { get set }
}
