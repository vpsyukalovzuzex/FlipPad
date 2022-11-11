//
// SettingsRouter.swift
//

import UIKit

class SettingsRouter: SettingsInputRouterProtocol {
    
    // MARK: - SettingsRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create() -> SettingsRouter {
        let view = SettingsView.instantiate()
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter()
        let router = SettingsRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
    
    // MARK: - SettingsInputRouterProtocol
    
    // Implement protocol.
}
