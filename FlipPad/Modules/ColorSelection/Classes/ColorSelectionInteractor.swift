//
// ColorSelectionInteractor.swift
//

import Foundation
import Core

class ColorSelectionInteractor: ColorSelectionInputInteractorProtocol {
    
    // MARK: -
    
    var palleteName: String?
    
    // MARK: - ColorSelectionInteractorProtocol
    
    weak var presenter: ColorSelectionOutputInteractorProtocol?
    
    // MARK: - ColorSelectionInputInteractorProtocol
    
    func start() {
        update()
    }
    
    func setColor(_ color: Color) {
        Settings.selectedColor = color
        update()
    }
    
    func setOpacity(_ opacity: Float) {
        Settings.selectedColorOpacity = opacity
        update()
    }
    
    func addNewColor(_ color: Color) throws {
        guard
            let palleteName = presenter?.palleteName,
            let pallete = PalletesManager.pallete(with: palleteName)
        else {
            return
        }
        try pallete.addColor(color)
        PalletesManager.setNeedsUpdate()
    }
    
    // MARK: -
    
    private func update() {
        presenter?.didUpdateColor(Settings.selectedColor)
        presenter?.didUpdateOpacity(Settings.selectedColorOpacity)
    }
}
