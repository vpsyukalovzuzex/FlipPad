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
    
    func showError(_ error: Error) {
        UIAlertController.showError(with: error, for: self)
    }
    
    func showError(with message: String) {
        UIAlertController.showError(with: message, for: self)
    }
    
    func showEdit(
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
    
    func showDelete(
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
}
