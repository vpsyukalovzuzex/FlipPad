//
// SettingsOutputInteractorProtocol.swift
//

import Foundation

protocol SettingsOutputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    func didUpdateVersion(_ version: String?)
    
    func didUpdateBuildNumber(_ buildNumber: String?)
    
    func didUpdateIsVerticalToolbars(_ isVerticalToolbars: Bool)
    
    func didUpdateXsheetPosition(_ xsheetPosition: Int)
}
