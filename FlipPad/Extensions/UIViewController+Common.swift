//
// UIViewController+Common.swift
//

import UIKit

extension UIViewController {
    
    // MARK: -
    
    static func instantiate() -> Self {
        return UIStoryboard(name: String(describing: self), bundle: nil).instantiateInitialViewController() as! Self
    }
    
    // MARK: -
    
#if targetEnvironment(macCatalyst)
    
    var macCatalystTitlebar: UITitlebar? {
        return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.titlebar
    }
    
    var macCatalystToolbar: NSToolbar? {
        get {
            return macCatalystTitlebar?.toolbar
        }
        set {
            macCatalystTitlebar?.toolbar = newValue
        }
    }
    
#endif
    
    // MARK: -
    
    func showErrorAlert(with error: Error) {
        UIAlertController.showError(with: error, for: self)
    }
    
    func showErrorAlert(with message: String) {
        UIAlertController.showError(with: message, for: self)
    }
    
    func showEditAlert(
        title: String?,
        message: String?,
        text: String?,
        placeholder: String?,
        block: @escaping (String) -> Void
    ) {
        UIAlertController.showEdit(
            title: title,
            message: message,
            text: text,
            placeholder: placeholder,
            for: self,
            block: block
        )
    }
    
    func showDeleteAlert(
        title: String?,
        message: String?,
        block: @escaping () -> Void
    ) {
        UIAlertController.showDelete(
            title: title,
            message: message,
            for: self,
            block: block
        )
    }
    
    func showDocumentPicker(
        with types: [String],
        mode: UIDocumentPickerMode,
        delegate: UIDocumentPickerDelegate?
    ) {
        UIDocumentPickerViewController.show(
            with: types,
            mode: mode,
            delegate: delegate,
            for: self
        )
    }
    
    func showDocumentPicker(
        with url: URL,
        mode: UIDocumentPickerMode,
        delegate: UIDocumentPickerDelegate?
    ) {
        UIDocumentPickerViewController.show(
            with: url,
            mode: mode,
            delegate: delegate,
            for: self
        )
    }
    
    // MARK: -
    
    func wrapInNavigationControllerIfNeeded() -> UIViewController {
        let isNeedNavigationController: Bool = .isPhone && !.isMacCatalyst
        return isNeedNavigationController ? wrapInNavigationController() : self
    }
}
