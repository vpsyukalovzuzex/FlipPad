//
// ColorsPresenterProtocol.swift
//

import Foundation

protocol ColorsPresenterProtocol: AnyObject {
    
    var view: ColorsInputViewProtocol? { get set }
    
    var interactor: ColorsInputInteractorProtocol? { get set }
    
    var router: ColorsInputRouterProtocol? { get set }
}
