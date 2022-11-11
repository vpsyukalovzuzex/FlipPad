//
// SettingsPresenter.swift
//

import Foundation

class SettingsPresenter: SettingsOutputViewProtocol,
                         SettingsOutputInteractorProtocol {
    
    // MARK: - SettingsPresenterProtocol
    
    weak var view: SettingsInputViewProtocol?
    
    var interactor: SettingsInputInteractorProtocol?
    
    var router: SettingsInputRouterProtocol?
    
    // MARK: - SettingsOutputViewProtocol
    
    func viewDidLoad() {
        interactor?.start()
    }
    
    func didChangeIsVerticalToolbars() {
        guard let isVerticalToolbars = view?.isVerticalToolbars else {
            return
        }
        interactor?.setIsVerticalToolbars(isVerticalToolbars)
    }
    
    func didChangeXsheetPositionSegmentedControl() {
        guard let xsheetPosition = view?.xsheetPosition else {
            return
        }
        interactor?.setXsheetPosition(xsheetPosition)
    }
    
    // MARK: - SettingsOutputInteractorProtocol
    
    func didUpdateVersion(_ version: String?) {
        view?.setVersion(version)
    }
    
    func didUpdateBuildNumber(_ buildNumber: String?) {
        view?.setBuildNumber("(\(buildNumber ?? "1"))")
    }
    
    func didUpdateIsVerticalToolbars(_ isVerticalToolbars: Bool) {
        view?.setIsVerticalToolbar(isVerticalToolbars)
    }
    
    func didUpdateXsheetPosition(_ xsheetPosition: Int) {
        view?.setXsheetPosition(xsheetPosition)
    }
}
