//
// ColorSelectionPresenter.swift
//

import Foundation
import UIKit
import Core
import FlexColorPicker

class ColorSelectionPresenter: ColorSelectionOutputViewProtocol,
                               ColorSelectionOutputInteractorProtocol,
                               ColorPickerDelegate {
    
    // MARK: -
    
    var palleteName: String?
    
    // MARK: - ColorSelectionPresenterProtocol
    
    weak var view: ColorSelectionInputViewProtocol?
    
    var interactor: ColorSelectionInputInteractorProtocol?
    
    var router: ColorSelectionInputRouterProtocol?
    
    // MARK: - ColorSelectionOutputViewProtocol
    
    func viewDidLoad() {
        interactor?.start()
    }
    
    func didTapNewColor() {
        router?.showNewColor(delegate: self)
    }
    
    func didChangeOpacity() {
        guard let opacity = view?.opacity else {
            return
        }
        interactor?.setOpacity(opacity)
    }
    
    // MARK: - ColorSelectionOutputInteractorProtocol
    
    func didUpdateColor(_ color: Color) {
        view?.setColor(color.uiColor)
    }
    
    func didUpdateOpacity(_ opacity: Float) {
        view?.setOpacity(opacity)
    }
    
    // MARK: - ColorsDelegate
    
    func didSelectColor(_ color: Color) {
        interactor?.setColor(color)
    }
    
    // MARK: - ColorPickerDelegate
    
    func colorPicker(_ colorPicker: ColorPickerController, confirmedColor: UIColor, usingControl: ColorControl) {
        let color = confirmedColor.color
        do {
            interactor?.setColor(color)
            try interactor?.addNewColor(color)
        } catch {
            view?.showErrorAlert(with: error)
        }
    }
}
