//
// EraserSettingsRouter.swift
//

import UIKit

class EraserSettingsRouter: EraserSettingsRouterProtocol,
                            EraserSettingsInputRouterProtocol {
    
    // MARK: - EraserSettingsRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create() -> EraserSettingsRouter {
        let view = EraserSettingsView.instantiate()
        let interactor = EraserSettingsInteractor()
        let presenter = EraserSettingsPresenter()
        let router = EraserSettingsRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
    
    // MARK: - EraserSettingsInputRouterProtocol
    
    // Implement protocol.
}
