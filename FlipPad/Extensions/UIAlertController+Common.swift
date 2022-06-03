//
// UIAlertController+Common.swift
//

import UIKit

extension UIAlertController {
    
    // MARK: -
    
    static func showError(with error: Error, for viewController: UIViewController) {
        showError(with: error.localizedDescription, for: viewController)
    }
    
    static func showError(with message: String, for viewController: UIViewController) {
        let alertController = UIAlertController(title: "Error".localized, message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK".localized, style: .default)
        alertController.addAction(okAlertAction)
        viewController.present(alertController, animated: true)
    }
    
    static func showEdit(
        title: String?,
        message: String?,
        text: String?,
        placeholder: String?,
        for viewController: UIViewController,
        block: @escaping (String) -> Void
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAlertAction = UIAlertAction(title: "Cancel".localized, style: .cancel)
        let okAlertAction = UIAlertAction(title: "OK".localized, style: .default) { _ in
            if let text = alertController.textFields?.first?.text {
                block(text)
            }
        }
        alertController.addTextField { textField in
            textField.text = text
            textField.placeholder = placeholder
        }
        alertController.addAction(cancelAlertAction)
        alertController.addAction(okAlertAction)
        viewController.present(alertController, animated: true)
    }
    
    static func showDelete(
        title: String?,
        message: String?,
        for viewController: UIViewController,
        block: @escaping () -> Void
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAlertAction = UIAlertAction(title: "Cancel".localized, style: .cancel)
        let deleteAlertAction = UIAlertAction(title: "Delete".localized, style: .destructive) { _ in
            block()
        }
        alertController.addAction(cancelAlertAction)
        alertController.addAction(deleteAlertAction)
        viewController.present(alertController, animated: true)
    }
}
