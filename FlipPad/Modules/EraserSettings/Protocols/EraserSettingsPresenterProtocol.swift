//
// EraserSettingsPresenterProtocol.swift
//

import Foundation

protocol EraserSettingsPresenterProtocol: AnyObject {
    
    var view: EraserSettingsInputViewProtocol? { get set }
    
    var interactor: EraserSettingsInputInteractorProtocol? { get set }
    
    var router: EraserSettingsInputRouterProtocol? { get set }
}
