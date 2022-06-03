//
// UIAlertControllerProtocol.swift
//

import UIKit

protocol UIAlertControllerProtocol: UIViewController {
    
    // MARK: -
    
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
