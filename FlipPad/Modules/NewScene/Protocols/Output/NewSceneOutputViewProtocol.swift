//
// NewSceneOutputViewProtocol.swift
//

import Foundation

protocol NewSceneOutputViewProtocol: AnyObject {
    
    // MARK: -
    
    func viewDidLoad()
    
    func didSelectResolution()
    
    func didChangeFps()
    
    func didSelectContinue()
}
