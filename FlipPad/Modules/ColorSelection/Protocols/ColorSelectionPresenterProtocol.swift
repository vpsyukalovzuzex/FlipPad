//
// ColorSelectionPresenterProtocol.swift
//

import Foundation

protocol ColorSelectionPresenterProtocol: AnyObject {
    
    var view: ColorSelectionInputViewProtocol? { get set }
    
    var interactor: ColorSelectionInputInteractorProtocol? { get set }
    
    var router: ColorSelectionInputRouterProtocol? { get set }
}
