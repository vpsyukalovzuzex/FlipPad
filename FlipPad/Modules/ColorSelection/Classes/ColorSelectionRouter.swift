//
// ColorSelectionRouter.swift
//

import UIKit
import FlexColorPicker

class ColorSelectionRouter: ColorSelectionRouterProtocol,
                            ColorSelectionInputRouterProtocol {
    
    // MARK: - ColorSelectionRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create(palleteName: String?) -> ColorSelectionRouter {
        let view = ColorSelectionView.instantiate()
        let interactor = ColorSelectionInteractor()
        let presenter = ColorSelectionPresenter()
        let router = ColorSelectionRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        presenter.palleteName = palleteName
        return router
    }
    
    // MARK: - ColorSelectionInputRouterProtocol
    
    func showNewColor(delegate: ColorPickerDelegate?) {
        let defaultColorPickerViewController = DefaultColorPickerViewController()
        defaultColorPickerViewController.delegate = delegate
        viewController?.navigationController?.pushViewController(defaultColorPickerViewController, animated: true)
    }
}
