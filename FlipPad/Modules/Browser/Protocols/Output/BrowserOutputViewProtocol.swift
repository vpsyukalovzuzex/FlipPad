//
// BrowserOutputViewProtocol.swift
//

import Foundation

protocol BrowserOutputViewProtocol: AnyObject {
    
    // MARK: -
    
    func viewDidLoad()
    
    func didTapNewScene()
    
    func didTapSettings()
    
    func didTapImport()
    
    func didTapRename()
    
    func didTapDuplicate()
    
    func didTapDelete()
    
    func didTapExport()
    
    func didTapSelect()
    
    func didTapDone()
    
    func didTapDocument()
}
