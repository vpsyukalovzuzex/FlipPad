//
// NewSceneOutputViewProtocol.swift
//

import Foundation

protocol NewSceneOutputViewProtocol: AnyObject {
    
    // MARK: -
    
    func viewDidLoad()
    
    func didChangeFps(_ fps: Float)
    
    func didSelectResolution(_ resolution: Int)
    
    func didSelectContinue()
}
