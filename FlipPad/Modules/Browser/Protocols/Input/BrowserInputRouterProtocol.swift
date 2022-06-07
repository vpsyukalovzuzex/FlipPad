//
// BrowserInputRouterProtocol.swift
//

import UIKit

protocol BrowserInputRouterProtocol: AnyObject {
    
    func showNewScene(with delegate: NewSceneDelegate?, sourceView: UIView, sourceRect: CGRect)
}
