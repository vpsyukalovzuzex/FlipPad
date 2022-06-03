//
// SettingsPresenterProtocol.swift
//

import Foundation

protocol SettingsPresenterProtocol: AnyObject {
    
    var view: SettingsInputViewProtocol? { get set }
    
    var interactor: SettingsInputInteractorProtocol? { get set }
    
    var router: SettingsInputRouterProtocol? { get set }
}
