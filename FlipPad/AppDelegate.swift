//
// AppDelegate.swift
//

import UIKit
import Core

@main class AppDelegate: UIResponder,
                         UIApplicationDelegate {
    
    // MARK: -
    
    var window: UIWindow?
    
    // MARK: -
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setup()
        setupUi()
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = BrowserRouter.create().viewController
        window?.makeKeyAndVisible()
        return true
    }
    
    // MARK: -
    
    private func setup() {
        let defaultFiles = [
            "Animation Tutorial",
            "How To"
        ]
        let pathExtension = PathExtension.dcfb.rawValue
        try? UrlManager.createDefaultFolder()
        try? UrlManager.createDefaultFiles(from: defaultFiles.compactMap { Bundle.main.url(forResource: $0, withExtension: pathExtension) })
    }
    
    private func setupUi() {
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
