//
// BrowserRouter.swift
//

import UIKit

class BrowserRouter: BrowserRouterProtocol,
                     BrowserInputRouterProtocol {
    
    // MARK: - BrowserRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create() -> BrowserRouter {
        let view = BrowserView.instantiate()
        let interactor = BrowserInteractor()
        let presenter = BrowserPresenter()
        let router = BrowserRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
    
    // MARK: - BrowserInputRouterProtocol
    
    func showNewScene(delegate: NewSceneDelegate?, sourceView: UIView, sourceRect: CGRect) {
        guard let newSceneViewController = NewSceneRouter.create(delegate: delegate).viewController else {
            return
        }
        let resultViewController = newSceneViewController.wrapInNavigationControllerIfNeeded()
        resultViewController.preferredContentSize = .newSceneViewPreferredContentSize
        resultViewController.modalPresentationStyle = .popover
        let popoverPresentationController = resultViewController.popoverPresentationController
        popoverPresentationController?.sourceView = sourceView
        popoverPresentationController?.sourceRect = sourceRect
        viewController?.present(resultViewController, animated: true)
    }
    
    func showSettings(sourceView: UIView, sourceRect: CGRect) {
        guard let settingsViewController = SettingsRouter.create().viewController else {
            return
        }
        let resultViewController = settingsViewController.wrapInNavigationControllerIfNeeded()
        resultViewController.preferredContentSize = .settingsViewPreferredContentSize
        resultViewController.modalPresentationStyle = .popover
        let popoverPresentationController = resultViewController.popoverPresentationController
        popoverPresentationController?.sourceView = sourceView
        popoverPresentationController?.sourceRect = sourceRect
        viewController?.present(resultViewController, animated: true)
    }
}
