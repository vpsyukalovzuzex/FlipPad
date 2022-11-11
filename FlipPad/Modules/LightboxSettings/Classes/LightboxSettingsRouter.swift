//
// LightboxSettingsRouter.swift
//

import UIKit

class LightboxSettingsRouter: LightboxSettingsInputRouterProtocol {
    
    // MARK: - LightboxSettingsRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create() -> LightboxSettingsRouter {
        let view = LightboxSettingsView.instantiate()
        let interactor = LightboxSettingsInteractor()
        let presenter = LightboxSettingsPresenter()
        let router = LightboxSettingsRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
    
    // MARK: - LightboxSettingsInputRouterProtocol
    
    // Implement protocol.
}
