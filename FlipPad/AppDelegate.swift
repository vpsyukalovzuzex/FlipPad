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
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        // window?.rootViewController = BrowserRouter.create().viewController
        // window?.rootViewController = PalletesRouter.create(defaultPalleteName: nil).viewController?.wrapInNavigationController()
        // window?.rootViewController = SettingsRouter.create().viewController?.wrapInNavigationController()
        // window?.rootViewController = DocumentSettingsRouter.create().viewController?.wrapInNavigationController()
        window?.rootViewController = LightboxSettingsRouter.create().viewController
        window?.makeKeyAndVisible()
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
        let defaultDocuments = [
            "Animation Tutorial",
            "How To"
        ]
        let defaultPalletes = [
            "Default"
        ]
        let document = FileExtension.dcfb.rawValue
        let pallete = FileExtension.dgcplt.rawValue
        let documentsUrls = defaultDocuments.compactMap { Bundle.main.url(forResource: $0, withExtension: document) }
        let palletesUrls = defaultPalletes.compactMap { Bundle.main.url(forResource: $0, withExtension: pallete) }
        try? URLManager.createDefaultFolderIfNeeded()
        try? URLManager.createDefaultDocumentsIfNeeded(from: documentsUrls)
        try? URLManager.createDefaultPalletesIfNeeded(from: palletesUrls)
    }
}
