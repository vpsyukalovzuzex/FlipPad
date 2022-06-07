//
// NewSceneInputViewProtocol.swift
//

import Foundation
import DifferenceKit

protocol NewSceneInputViewProtocol: AnyObject {
    
    // MARK: -
    
    var selectedIndexPaths: [IndexPath]? { get }
    
    // MARK: -
    
    func setFpsFloat(_ fpsFloat: Float)
    
    func setFpsString(_ fpsString: String?)
    
    func setNewSource(_ newSource: [NewSceneView.Element])
    
    func setSelectIndexPaths(_ indexPaths: [IndexPath])
    func setSelectIndexPaths(_ indexPaths: [IndexPath], animated: Bool)
}
