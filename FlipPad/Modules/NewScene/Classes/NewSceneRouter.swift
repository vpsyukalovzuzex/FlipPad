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
    
    static func create(delegate: NewSceneDelegate?) -> NewSceneRouter {
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
        presenter.delegate = delegate
        return router
    }
    
    // MARK: - NewSceneInputRouterProtocol
    
    func cancel() {
        viewController?.dismiss(animated: true)
    }
}
