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
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = NewSceneRouter.create().viewController
        window?.makeKeyAndVisible()
        return true
    }
}
