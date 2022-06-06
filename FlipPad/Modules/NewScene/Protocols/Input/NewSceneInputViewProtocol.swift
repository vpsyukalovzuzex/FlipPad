//
// NewSceneInputViewProtocol.swift
//

import Foundation
import DifferenceKit

protocol NewSceneInputViewProtocol: AnyObject {
    
    // MARK: -
    
    var fps: Int { get set }
    
    var selectedIndexPaths: [IndexPath]? { get }
    
    var source: [NewSceneView.Element] { get set }
    
    // MARK: -
    
    func selectIndexPath(_ indexPath: IndexPath)
    func selectIndexPath(_ indexPath: IndexPath, animated: Bool)
}
