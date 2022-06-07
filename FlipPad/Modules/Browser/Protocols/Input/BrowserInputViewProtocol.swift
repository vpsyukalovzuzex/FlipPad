//
// BrowserInputViewProtocol.swift
//

import Foundation
import DifferenceKit

protocol BrowserInputViewProtocol: AnyObject {
    
    // MARK: -
    
    var selectedIndexPaths: [IndexPath]? { get }
    
    // MARK: -
    
    func setAction(_ action: BrowserView.Action)
    func setAction(_ action: BrowserView.Action, animated: Bool)
    
    func setNewSource(_ newSource: [ArraySection<BrowserView.Section, BrowserView.Element>])
    
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?)
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?, animated: Bool)
}
