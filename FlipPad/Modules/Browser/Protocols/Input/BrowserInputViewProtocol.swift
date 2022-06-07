//
// BrowserInputViewProtocol.swift
//

import UIKit
import DifferenceKit

protocol BrowserInputViewProtocol: AnyObject {
    
    // MARK: -
    
    var selectedIndexPaths: [IndexPath]? { get }
    
    var sourceView: UIView { get }
    
    var sourceRect: CGRect { get }
    
    // MARK: -
    
    func setAction(_ action: BrowserView.Action)
    func setAction(_ action: BrowserView.Action, animated: Bool)
    
    func setNewSource(_ newSource: [ArraySection<BrowserView.Section, BrowserView.Element>])
    
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?)
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?, animated: Bool)
    
    func showError(_ error: Error)
    
    func showEdit(
        title: String?,
        message: String?,
        text: String?,
        placeholder: String?,
        block: @escaping (String) -> Void
    )
    
    func showDelete(
        title: String?,
        message: String?,
        block: @escaping () -> Void
    )
}
