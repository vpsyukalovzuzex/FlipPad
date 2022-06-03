//
// PalletesInputViewProtocol.swift
//

import Foundation

protocol PalletesInputViewProtocol: UIAlertControllerProtocol,
                                    UICollectionViewProtocol {
    
    // MARK: -
    
    var action: PalletesView.Action { get }
    
    // MARK: -
    
    func setAction(_ action: PalletesView.Action)
    func setAction(_ action: PalletesView.Action, animated: Bool)
    
    func setNewSource(_ newSource: [PalletesView.Element])
}
