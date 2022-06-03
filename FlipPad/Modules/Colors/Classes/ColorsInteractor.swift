//
// ColorsInteractor.swift
//

import Foundation
import Support
import Core

class ColorsInteractor: ColorsInteractorProtocol,
                        ColorsInputInteractorProtocol,
                        PalletesManagerDelegate {
    
    // MARK: - ColorsInteractorProtocol
    
    weak var presenter: ColorsOutputInteractorProtocol?
    
    // MARK: - ColorsInputInteractorProtocol
    
    var colors = [Color]()
    
    // MARK: -
    
    func start() {
        PalletesManager.addObserver(self)
        PalletesManager.setNeedsUpdate()
    }
    
    // MARK: -
    
    func didSetNeedsUpdatePalletes() {
        guard
            let palleteName = presenter?.palleteName,
            let pallete = PalletesManager.pallete(with: palleteName)
        else {
            return
        }
        colors = pallete.colors
        presenter?.didUpdateColors(colors)
    }
}
