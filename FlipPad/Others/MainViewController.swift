//
// MainViewController.swift
//

import UIKit
import Core

class MainViewController: UIViewController {
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let viewController = BrowserRouter.create().viewController else {
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: false)
    }
    
    // MARK: -
    
    private func setup() {
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
