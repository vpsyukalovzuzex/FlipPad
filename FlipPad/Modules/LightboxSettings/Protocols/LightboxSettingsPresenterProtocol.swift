//
// LightboxSettingsPresenterProtocol.swift
//

import Foundation

protocol LightboxSettingsPresenterProtocol: AnyObject {
    
    var view: LightboxSettingsInputViewProtocol? { get set }
    
    var interactor: LightboxSettingsInputInteractorProtocol? { get set }
    
    var router: LightboxSettingsInputRouterProtocol? { get set }
}
