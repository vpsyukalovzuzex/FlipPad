//
// LightboxSettingsOutputViewProtocol.swift
//

import Foundation

protocol LightboxSettingsOutputViewProtocol: AnyObject {
    
    // MARK: -
    
    func viewDidLoad()
    
    func didChangePreviousDrawingCount()
    
    func didChangeRangeOpacity()
    
    func didChangeAlwaysDisplayBackground()
}
