//
// BrowserInputRouterProtocol.swift
//

import UIKit

protocol BrowserInputRouterProtocol: AnyObject {
    
    func showNewScene(delegate: NewSceneDelegate?, sourceView: UIView, sourceRect: CGRect)
    
    func showSettings(sourceView: UIView, sourceRect: CGRect)
}
