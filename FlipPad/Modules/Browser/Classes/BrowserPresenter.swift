//
// BrowserPresenter.swift
//

import Foundation
import DifferenceKit

class BrowserPresenter: BrowserPresenterProtocol,
                        BrowserOutputViewProtocol,
                        BrowserOutputInteractorProtocol {
    
    // MARK: - BrowserPresenterProtocol
    
    weak var view: BrowserInputViewProtocol?
    
    var interactor: BrowserInputInteractorProtocol?
    
    var router: BrowserInputRouterProtocol?
    
    // MARK: - BrowserOutputViewProtocol
    
    func viewDidLoad() {
        // TODO: -
        view?.source = [
            ArraySection(
                model: BrowserView.Section(id: ""),
                elements: [
                    BrowserView.Element(
                        id: "0",
                        thumbnail: #imageLiteral(resourceName: "bar_music"),
                        name: "asdasd",
                        isLoading: false
                    ),
                    BrowserView.Element(
                        id: "1",
                        thumbnail: #imageLiteral(resourceName: "bar_music"),
                        name: "asdasd",
                        isLoading: false
                    ),
                    BrowserView.Element(
                        id: "2",
                        thumbnail: #imageLiteral(resourceName: "bar_music"),
                        name: "asdasd",
                        isLoading: false
                    ),
                    BrowserView.Element(
                        id: "3",
                        thumbnail: #imageLiteral(resourceName: "bar_music"),
                        name: "asdasd",
                        isLoading: false
                    ),
                    BrowserView.Element(
                        id: "4",
                        thumbnail: #imageLiteral(resourceName: "bar_music"),
                        name: "asdasd",
                        isLoading: false
                    ),
                    BrowserView.Element(
                        id: "5",
                        thumbnail: #imageLiteral(resourceName: "bar_music"),
                        name: "asdasd",
                        isLoading: false
                    )
                ]
            )
        ]
    }
    
    func didSelectNewScene() {
        // TODO: -
    }
    
    func didSelectImport() {
        // TODO: -
    }
    
    func didSelectRename() {
        // TODO: -
    }
    
    func didSelectDuplicate() {
        // TODO: -
    }
    
    func didSelectDelete() {
        // TODO: -
    }
    
    func didSelectExport() {
        // TODO: -
    }
    
    func didSelectDocument() {
        // TODO: -
    }
    
    // MARK: - BrowserOutputInteractorProtocol
    
    // Implement protocol.
}
