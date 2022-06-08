//
// UIDocumentPickerViewController+Common.swift
//

import UIKit

extension UIDocumentPickerViewController {
    
    // MARK: -
    
    static func show(
        with types: [String],
        mode: UIDocumentPickerMode,
        delegate: UIDocumentPickerDelegate?,
        for viewController: UIViewController
    ) {
        let documentPickerViewController = UIDocumentPickerViewController(documentTypes: types, in: mode)
        documentPickerViewController.delegate = delegate
        documentPickerViewController.allowsMultipleSelection = true
        viewController.present(documentPickerViewController, animated: true)
    }
    
    static func show(
        with url: URL,
        mode: UIDocumentPickerMode,
        delegate: UIDocumentPickerDelegate?,
        for viewController: UIViewController
    ) {
        let documentPickerViewController = UIDocumentPickerViewController(url: url, in: mode)
        documentPickerViewController.delegate = delegate
        documentPickerViewController.allowsMultipleSelection = true
        viewController.present(documentPickerViewController, animated: true)
    }
}
