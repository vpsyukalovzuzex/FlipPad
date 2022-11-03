//
// AppDelegate.swift
//

import UIKit

@main class AppDelegate: UIResponder,
                         UIApplicationDelegate {
    
    // MARK: -
    
    var window: UIWindow?
    
    // MARK: -
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setup()
        return true
    }
    
    // MARK: -
    
    private func setup() {
#if targetEnvironment(macCatalyst)
        if let titlebar = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.titlebar {
            titlebar.titleVisibility = .visible
            if #available(macCatalyst 14.0, *) {
                titlebar.toolbarStyle = .expanded
            }
        }
#endif
    }
}
