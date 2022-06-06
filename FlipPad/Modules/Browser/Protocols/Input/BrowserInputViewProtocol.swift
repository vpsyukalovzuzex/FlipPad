//
// BrowserInputViewProtocol.swift
//

import Foundation
import DifferenceKit

protocol BrowserInputViewProtocol: AnyObject {
    
    // MARK: -
    
    var isSelection: Bool { get }
    
    var selectedIndexPaths: [IndexPath]? { get }
    
    var source: [ArraySection<BrowserView.Section, BrowserView.Element>] { get set }
    
    // MARK: -
    
    func deselectAllDocuments()
    func deselectAllDocuments(animated: Bool)
}
