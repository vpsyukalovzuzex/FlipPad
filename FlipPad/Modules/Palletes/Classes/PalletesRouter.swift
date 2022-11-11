//
// PalletesRouter.swift
//

import UIKit
import Core

class PalletesRouter: PalletesInputRouterProtocol {
    
    // MARK: - PalletesRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create(defaultPalleteName: String?) -> PalletesRouter {
        let view = PalletesView.instantiate()
        let interactor = PalletesInteractor()
        let presenter = PalletesPresenter()
        let router = PalletesRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        presenter.defaultPalleteName = defaultPalleteName
        return router
    }
    
    // MARK: - PalletesInputRouterProtocol
    
    func showColorSelection(palleteName: String?) {
        guard let colorSelectionViewController = ColorSelectionRouter.create(palleteName: palleteName).viewController else {
            return
        }
        viewController?.navigationController?.pushViewController(colorSelectionViewController, animated: true)
    }
}
