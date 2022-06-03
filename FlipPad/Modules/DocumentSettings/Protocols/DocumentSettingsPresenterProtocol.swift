//
// DocumentSettingsPresenterProtocol.swift
//

import Foundation

protocol DocumentSettingsPresenterProtocol: AnyObject {
    
    var view: DocumentSettingsInputViewProtocol? { get set }
    
    var interactor: DocumentSettingsInputInteractorProtocol? { get set }
    
    var router: DocumentSettingsInputRouterProtocol? { get set }
}
