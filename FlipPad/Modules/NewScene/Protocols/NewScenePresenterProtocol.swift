//
// NewScenePresenterProtocol.swift
//

import Foundation

protocol NewScenePresenterProtocol: AnyObject {
    
    var view: NewSceneInputViewProtocol? { get set }
    
    var interactor: NewSceneInputInteractorProtocol? { get set }
    
    var router: NewSceneInputRouterProtocol? { get set }
}
