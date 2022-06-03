//
// DocumentSettingsRouter.swift
//

import UIKit

class DocumentSettingsRouter: DocumentSettingsRouterProtocol,
                              DocumentSettingsInputRouterProtocol {
    
    // MARK: - DocumentSettingsRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create() -> DocumentSettingsRouter {
        let view = DocumentSettingsView.instantiate()
        let interactor = DocumentSettingsInteractor()
        let presenter = DocumentSettingsPresenter()
        let router = DocumentSettingsRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
    
    // MARK: - DocumentSettingsInputRouterProtocol
    
    // Implement protocol.
}
