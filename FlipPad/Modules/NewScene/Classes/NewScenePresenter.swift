//
// NewScenePresenter.swift
//

import Foundation

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
    
    func didSelectResolution() {
        interactor?.resolution = view?.selectedIndexPaths?.first?.row ?? 0
    }
    
    func didChangeFps() {
        interactor?.fps = view?.fps ?? 0
    }
    
    func didSelectContinue() {
        // TODO: -
    }
    
    // MARK: - NewSceneOutputInteractorProtocol
    
    func didUpdateFps() {
        view?.fps = interactor?.fps ?? 0
    }
    
    func didUpdateResolution() {
        let row = interactor?.resolution ?? 0
        let indexPath = IndexPath(row: row, section: 0)
        DispatchQueue.main.async { [weak self] in
            self?.view?.selectIndexPath(indexPath, animated: true)
        }
    }
    
    func didUpdateResolutions() {
        view?.source = interactor?.resolutions.map { NewSceneView.Element(title: "\($0)") } ?? []
    }
}
