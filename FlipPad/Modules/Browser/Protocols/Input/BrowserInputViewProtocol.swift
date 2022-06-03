//
// BrowserInputViewProtocol.swift
//

import UIKit
import DifferenceKit

protocol BrowserInputViewProtocol: UIAlertControllerProtocol,
                                   UICollectionViewProtocol {
    
    // MARK: -
        
    var action: BrowserView.Action { get }
    
    var sourceView: UIView { get }
    
    var sourceRect: CGRect { get }
    
    // MARK: -
    
    func setAction(_ action: BrowserView.Action)
    func setAction(_ action: BrowserView.Action, animated: Bool)
    
    func setNewSource(_ newSource: [ArraySection<BrowserView.Section, BrowserView.Element>])
}
