//
// NewSceneInputViewProtocol.swift
//

import Foundation
import DifferenceKit

protocol NewSceneInputViewProtocol: UIAlertControllerProtocol,
                                    UICollectionViewProtocol {
    
    // MARK: -
    
    func setFpsFloat(_ fpsFloat: Float)
    
    func setMinFpsFloat(_ minFps: Float)
    func setMaxFpsFloat(_ maxFps: Float)
    
    func setFpsString(_ fpsString: String?)
    
    func setNewSource(_ newSource: [NewSceneView.Element])
}
