//
// NewSceneOutputViewProtocol.swift
//

import Foundation

protocol NewSceneOutputViewProtocol: AnyObject {
    
    // MARK: -
    
    func viewDidLoad()
    
    func didChangeFps(_ fps: Float)
    
    func didTapResolution(at indexPath: IndexPath)
    
    func didTapCancel()
    
    func didTapContinue()
}
