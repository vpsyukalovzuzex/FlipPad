//
// NewScenePresenter.swift
//

import Foundation
import Core

class NewScenePresenter: NewScenePresenterProtocol,
                         NewSceneOutputViewProtocol,
                         NewSceneOutputInteractorProtocol {
    
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
    
    func didSelectResolution(_ resolution: Int) {
        interactor?.setResolution(resolution)
    }
    
    func didSelectContinue() {
        // TODO: -
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
    
    func didUpdateResolution(_ resolution: Int) {
        let indexPath = IndexPath(row: resolution, section: 0)
        view?.setSelectIndexPaths([indexPath])
    }
}
