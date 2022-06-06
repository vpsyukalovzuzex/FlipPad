//
// BrowserOutputViewProtocol.swift
//

import Foundation

protocol BrowserOutputViewProtocol: AnyObject {
    
    // MARK: -
    
    func viewDidLoad()
    
    func didSelectNewScene()
    
    func didSelectImport()
    
    func didSelectRename()
    
    func didSelectDuplicate()
    
    func didSelectDelete()
    
    func didSelectExport()
    
    func didSelectDocument()
}
