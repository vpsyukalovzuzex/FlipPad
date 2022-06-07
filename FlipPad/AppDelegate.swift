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
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = BrowserRouter.create().viewController
        window?.makeKeyAndVisible()
        return true
    }
    
    // MARK: -
    
    private func setup() {
#if targetEnvironment(macCatalyst)
        guard let titlebar = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.titlebar else {
            return
        }
        titlebar.titleVisibility = .visible
        if #available(macCatalyst 14.0, *) {
            titlebar.toolbarStyle = .expanded
        }
#endif
    }
}
