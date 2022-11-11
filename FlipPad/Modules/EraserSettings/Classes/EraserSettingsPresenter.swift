//
// EraserSettingsPresenter.swift
//

import Foundation

class EraserSettingsPresenter: EraserSettingsOutputViewProtocol,
                               EraserSettingsOutputInteractorProtocol {
    
    // MARK: - EraserSettingsPresenterProtocol
    
    weak var view: EraserSettingsInputViewProtocol?
    
    var interactor: EraserSettingsInputInteractorProtocol?
    
    var router: EraserSettingsInputRouterProtocol?
    
    // MARK: - EraserSettingsOutputViewProtocol
    
    func viewDidLoad() {
        interactor?.start()
    }
    
    func didChangeSize() {
        guard let size = view?.size else {
            return
        }
        interactor?.setSize(Int(size))
    }
    
    func didChangeHardness() {
        guard let hardness = view?.hardness else {
            return
        }
        interactor?.setHardness(Int(hardness))
    }
    
    // MARK: - EraserSettingsOutputInteractorProtocol
    
    func didUpdateMinSize(_ minSize: Int) {
        view?.setMinSizeFloat(Float(minSize))
    }
    
    func didUpdateMaxSize(_ maxSize: Int) {
        view?.setMaxSizeFloat(Float(maxSize))
    }
    
    func didUpdateSize(_ size: Int) {
        view?.setSizeFloat(Float(size))
        view?.setSizeString("\(size)")
    }
    
    func didUpdateMinHardness(_ minHardness: Int) {
        view?.setMinHardnessFloat(Float(minHardness))
    }
    
    func didUpdateMaxHardness(_ maxHardness: Int) {
        view?.setMaxHardnessFloat(Float(maxHardness))
    }
    
    func didUpdateHardness(_ hardness: Int) {
        view?.setHardnessFloat(Float(hardness))
        view?.setHardnessString("\(hardness)")
    }
}
