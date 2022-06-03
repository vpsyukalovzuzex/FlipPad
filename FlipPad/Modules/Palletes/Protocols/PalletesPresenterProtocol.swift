//
// PalletesPresenterProtocol.swift
//

import Foundation

protocol PalletesPresenterProtocol: AnyObject {
    
    var view: PalletesInputViewProtocol? { get set }
    
    var interactor: PalletesInputInteractorProtocol? { get set }
    
    var router: PalletesInputRouterProtocol? { get set }
}
