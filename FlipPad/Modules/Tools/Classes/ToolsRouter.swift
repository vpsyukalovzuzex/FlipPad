//
// ToolsRouter.swift
//

import UIKit

class ToolsRouter: ToolsRouterProtocol,
                   ToolsInputRouterProtocol {
    
    // MARK: - ToolsRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create() -> ToolsRouter {
        let view = ToolsView.instantiate()
        let interactor = ToolsInteractor()
        let presenter = ToolsPresenter()
        let router = ToolsRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
    
    // MARK: - ToolsInputRouterProtocol
    
    // Implement protocol.
}
