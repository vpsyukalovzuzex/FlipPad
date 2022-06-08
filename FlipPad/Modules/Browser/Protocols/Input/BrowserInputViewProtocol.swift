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
    
    func showErrorAlert(with error: Error)
    
    func showErrorAlert(with message: String)
    
    func showEditAlert(
        title: String?,
        message: String?,
        text: String?,
        placeholder: String?,
        block: @escaping (String) -> Void
    )
    
    func showDeleteAlert(
        title: String?,
        message: String?,
        block: @escaping () -> Void
    )
    
    func showDocumentPicker(
        with types: [String],
        mode: UIDocumentPickerMode,
        delegate: UIDocumentPickerDelegate?
    )
    
    func showDocumentPicker(
        with url: URL,
        mode: UIDocumentPickerMode,
        delegate: UIDocumentPickerDelegate?
    )
}
