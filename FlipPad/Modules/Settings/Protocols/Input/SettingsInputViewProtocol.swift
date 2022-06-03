//
// SettingsInputViewProtocol.swift
//

import Foundation

protocol SettingsInputViewProtocol: UIAlertControllerProtocol {
    
    // TODO: -
    
    var isVerticalToolbars: Bool { get }
    
    var xsheetPosition: Int { get }
    
    // MARK: -
    
    func setVersion(_ version: String?)
    
    func setBuildNumber(_ buildNumber: String?)
    
    func setIsVerticalToolbar(_ isVerticalToolbar: Bool)
    func setIsVerticalToolbar(_ isVerticalToolbar: Bool, animated: Bool)
    
    func setXsheetPosition(_ xsheetPosition: Int)
}
