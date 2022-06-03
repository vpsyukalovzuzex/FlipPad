//
// DocumentSettingsPresenter.swift
//

import Foundation
import Core

class DocumentSettingsPresenter: DocumentSettingsPresenterProtocol,
                                 DocumentSettingsOutputViewProtocol,
                                 DocumentSettingsOutputInteractorProtocol {
    
    // MARK: - DocumentSettingsPresenterProtocol
    
    weak var view: DocumentSettingsInputViewProtocol?
    
    var interactor: DocumentSettingsInputInteractorProtocol?
    
    var router: DocumentSettingsInputRouterProtocol?
    
    // MARK: - DocumentSettingsOutputViewProtocol
    
    func viewDidLoad() {
        interactor?.start()
    }
    
    func didChangeFps() {
        guard let fps = view?.fps else {
            return
        }
        interactor?.setFps(Int(fps))
    }
    
    // MARK: - DocumentSettingsOutputInteractorProtocol
    
    func didUpdateResolution(_ resolution: Resolution) {
        view?.setResolution("\(resolution)")
    }
    
    func didUpdateMinFps(_ minFps: Int) {
        view?.setMinFpsFloat(Float(minFps))
    }
    
    func didUpdateMaxFps(_ maxFps: Int) {
        view?.setMaxFpsFloat(Float(maxFps))
    }
    
    func didUpdateFps(_ fps: Int) {
        view?.setFpsFloat(Float(fps))
        view?.setFpsString("\(Int(fps))")
    }
}
