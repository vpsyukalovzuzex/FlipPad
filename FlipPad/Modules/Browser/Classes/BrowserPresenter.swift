//
// BrowserPresenter.swift
//

import Foundation
import DifferenceKit

class BrowserPresenter: BrowserPresenterProtocol,
                        BrowserOutputViewProtocol,
                        BrowserOutputInteractorProtocol,
                        NewSceneDelegate {
    
    // MARK: - BrowserPresenterProtocol
    
    weak var view: BrowserInputViewProtocol?
    
    var interactor: BrowserInputInteractorProtocol?
    
    var router: BrowserInputRouterProtocol?
    
    // MARK: - BrowserOutputViewProtocol
    
    func viewDidLoad() {
        view?.setAction(.default, animated: false)
        // TODO: -
        let newSource = [
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
        view?.setNewSource(newSource)
    }
    
    func didTapNewScene() {
        guard let view = view else {
            return
        }
        router?.showNewScene(with: self, sourceView: view.sourceView, sourceRect: view.sourceRect)
    }
    
    func didTapImport() {
        // TODO: -
    }
    
    func didTapRename() {
        guard let row = view?.selectedIndexPaths?.first?.row else {
            return
        }
        view?.showEdit(
            title: "Rename \(row)".localized,
            message: "Enter a new name for this scene:".localized,
            text: nil,
            placeholder: "New scene name".localized
        ) { text in
            print("-->> \(text) \(row)")
        }
    }
    
    func didTapDuplicate() {
        // TODO: -
    }
    
    func didTapDelete() {
        guard let row = view?.selectedIndexPaths?.first?.row else {
            return
        }
        view?.showDelete(
            title: "Delete \(row)".localized,
            message: "Are you sure you want to delete this scene and all of its images?".localized
        ) {
            print("-->> \(row)")
        }
    }
    
    func didTapExport() {
        // TODO: -
    }
    
    func didTapSelect() {
        view?.setAction(.selection)
    }
    
    func didTapDone() {
        view?.setAction(.default)
    }
    
    func didTapDocument(at indexPath: IndexPath) {
        // TODO: -
    }
    
    // MARK: - BrowserOutputInteractorProtocol
    
    // Implement protocol.
    
    // MARK: - NewSceneDelegate
    
    func didTapContinue() {
        // TODO: -
    }
}
