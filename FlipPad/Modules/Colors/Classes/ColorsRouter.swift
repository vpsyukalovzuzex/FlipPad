//
// ColorsRouter.swift
//

import UIKit
import Core

protocol ColorsDelegate: AnyObject {
    
    func didSelectColor(_ color: Color)
}

class ColorsRouter: ColorsInputRouterProtocol {
    
    // MARK: - ColorsRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create(palleteName: String, delegate: ColorsDelegate?) -> ColorsRouter {
        let view = ColorsView.instantiate()
        let interactor = ColorsInteractor()
        let presenter = ColorsPresenter()
        let router = ColorsRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        presenter.palleteName = palleteName
        presenter.delegate = delegate
        return router
    }
    
    // MARK: - ColorsInputRouterProtocol
    
    // Implement protocol.
}
