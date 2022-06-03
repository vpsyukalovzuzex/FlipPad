//
// ColorSelectionInputViewProtocol.swift
//

import UIKit

protocol ColorSelectionInputViewProtocol: UIAlertControllerProtocol {
    
    // MARK: -
    
    var opacity: Float { get }
    
    // MARK: -
    
    func setColor(_ color: UIColor)
    
    func setOpacity(_ opacity: Float)
}
