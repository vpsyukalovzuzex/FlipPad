//
// ColorsInputViewProtocol.swift
//

import Foundation

protocol ColorsInputViewProtocol: UIAlertControllerProtocol,
                                  UICollectionViewProtocol {
    
    // MARK: -
    
    func setNewSource(_ newSource: [ColorsView.Element])
}
