//
// NewSceneRouter.swift
//

import UIKit

protocol NewSceneDelegate: AnyObject {
    
    func didTapContinue()
}

class NewSceneRouter: NewSceneRouterProtocol,
                      NewSceneInputRouterProtocol {
    
    // MARK: - NewSceneRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create(with delegate: NewSceneDelegate? = nil) -> NewSceneRouter {
        let view = NewSceneView.instantiate()
        let interactor = NewSceneInteractor()
        let presenter = NewScenePresenter()
        let router = NewSceneRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.delegate = delegate
        router.viewController = view
        return router
    }
    
    // MARK: - NewSceneInputRouterProtocol
    
    // Implement protocol.
}
