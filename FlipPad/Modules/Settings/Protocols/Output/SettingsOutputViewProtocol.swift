//
// SettingsOutputViewProtocol.swift
//

import Foundation

protocol SettingsOutputViewProtocol: AnyObject {
    
    // MARK: -
    
    func viewDidLoad()
    
    func didChangeIsVerticalToolbars()
    
    func didChangeXsheetPositionSegmentedControl()
}
