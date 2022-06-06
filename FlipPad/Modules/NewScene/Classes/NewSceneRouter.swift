//
// NewSceneRouter.swift
//

import UIKit

class NewSceneRouter: NewSceneRouterProtocol,
                      NewSceneInputRouterProtocol {
    
    // MARK: - NewSceneRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create() -> NewSceneRouter {
        let view = NewSceneView.instantiate()
        let interactor = NewSceneInteractor()
        let presenter = NewScenePresenter()
        let router = NewSceneRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
    
    // MARK: - NewSceneInputRouterProtocol
    
    // Implement protocol.
}
