//
// LightboxSettingsPresenter.swift
//

import Foundation

class LightboxSettingsPresenter: LightboxSettingsOutputViewProtocol,
                                 LightboxSettingsOutputInteractorProtocol {
    
    // MARK: - LightboxSettingsPresenterProtocol
    
    weak var view: LightboxSettingsInputViewProtocol?
    
    var interactor: LightboxSettingsInputInteractorProtocol?
    
    var router: LightboxSettingsInputRouterProtocol?
    
    // MARK: - LightboxSettingsOutputViewProtocol
    
    func viewDidLoad() {
        interactor?.start()
    }
    
    func didChangePreviousDrawingCount() {
        guard let previousDrawingCount = view?.previousDrawingCount else {
            return
        }
        interactor?.setPreviousDrawingCount(Int(previousDrawingCount))
    }
    
    func didChangeRangeOpacity() {
        guard let rangeOpacity = view?.rangeOpacity else {
            return
        }
        interactor?.setRangeOpacity(rangeOpacity)
    }
    
    func didChangeAlwaysDisplayBackground() {
        guard let isAlwaysDisplayBackground = view?.isAlwaysDisplayBackground else {
            return
        }
        interactor?.setIsAlwaysDisplayBackground(isAlwaysDisplayBackground)
    }
    
    // MARK: - LightboxSettingsOutputInteractorProtocol
    
    func didUpdateMinPreviuosDrawingCount(_ minPreviuosDrawingCount: Int) {
        view?.setMinPreviousDrawingCountFloat(Float(minPreviuosDrawingCount))
    }
    
    func didUpdateMaxPreviuosDrawingCount(_ maxPreviuosDrawingCount: Int) {
        view?.setMaxPreviousDrawingCountFloat(Float(maxPreviuosDrawingCount))
    }
    
    func didUpdatePreviuosDrawingCount(_ previuosDrawingCount: Int) {
        view?.setPreviousDrawingCountFloat(Float(previuosDrawingCount))
        view?.setPreviousDrawingCountString("\(previuosDrawingCount)")
    }
    
    func didUpdateRangeOpacity(_ rangeOpacity: Range<Float>) {
        view?.setRangeOpacity(rangeOpacity)
        view?.setMinRangeOpacityString(String(format: "%0.2f", rangeOpacity.lowerBound))
        view?.setMaxRangeOpacityString(String(format: "%0.2f", rangeOpacity.upperBound))
    }
    
    func didUpdateIsAlwaysDisplayBackground(_ isAlwaysDisplayBackground: Bool) {
        view?.setIsAlwaysDisplayBackground(isAlwaysDisplayBackground)
    }
}
