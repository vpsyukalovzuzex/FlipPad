//
// NewScenePresenter.swift
//

import Foundation
import Core

class NewScenePresenter: NewScenePresenterProtocol,
                         NewSceneOutputViewProtocol,
                         NewSceneOutputInteractorProtocol {
    
    // MARK: -
    
    weak var delegate: NewSceneDelegate?
    
    // MARK: - NewScenePresenterProtocol
    
    weak var view: NewSceneInputViewProtocol?
    
    var interactor: NewSceneInputInteractorProtocol?
    
    var router: NewSceneInputRouterProtocol?
    
    // MARK: - NewSceneOutputViewProtocol
    
    func viewDidLoad() {
        interactor?.start()
    }
    
    func didChangeFps(_ fps: Float) {
        interactor?.setFps(Int(fps))
    }
    
    func didTapResolution(at indexPath: IndexPath) {
        interactor?.setResolution(indexPath.row)
    }
    
    func didTapCancel() {
        router?.cancel()
    }
    
    func didTapContinue() {
        delegate?.didTapContinue()
    }
    
    // MARK: - NewSceneOutputInteractorProtocol
    
    func didUpdateAllResolutions(_ allResolutions: [Resolution]) {
        let newSource = allResolutions.map { NewSceneView.Element(title: "\($0)") }
        view?.setNewSource(newSource)
    }
    
    func didUpdateFps(_ fps: Int) {
        view?.setFpsString("\(fps)")
        view?.setFpsFloat(Float(fps))
    }
    
    func didUpdateMinFps(_ minFps: Int) {
        view?.setMinFpsFloat(Float(minFps))
    }
    
    func didUpdateMaxFps(_ maxFps: Int) {
        view?.setMaxFpsFloat(Float(maxFps))
    }
    
    func didUpdateResolution(_ resolution: Int) {
        let indexPath = IndexPath(row: resolution, section: 0)
        view?.setSelectIndexPaths([indexPath])
    }
}
