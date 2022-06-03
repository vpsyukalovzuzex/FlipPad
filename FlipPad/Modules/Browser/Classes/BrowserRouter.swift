//
// BrowserRouter.swift
//

import UIKit

class BrowserRouter: BrowserRouterProtocol,
                     BrowserInputRouterProtocol {
    
    // MARK: - BrowserRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create() -> BrowserRouter {
        let view = BrowserView.instantiate()
        let interactor = BrowserInteractor()
        let presenter = BrowserPresenter()
        let router = BrowserRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
    
    // MARK: - BrowserInputRouterProtocol
    
    // Implement protocol.
}
