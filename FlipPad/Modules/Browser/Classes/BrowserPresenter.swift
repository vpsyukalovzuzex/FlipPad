//
// BrowserPresenter.swift
//

import UIKit
import DifferenceKit
import Core
import Support

class BrowserPresenter: NSObject,
                        BrowserOutputViewProtocol,
                        BrowserOutputInteractorProtocol,
                        NewSceneDelegate,
                        UIDocumentPickerDelegate {
    
    // MARK: - BrowserPresenterProtocol
    
    weak var view: BrowserInputViewProtocol?
    
    var interactor: BrowserInputInteractorProtocol?
    
    var router: BrowserInputRouterProtocol?
    
    // MARK: - BrowserOutputViewProtocol
    
    func viewDidLoad() {
        view?.setAction(.default, animated: false)
        interactor?.start()
    }
    
    func didTapNewScene() {
        guard let view = view else {
            return
        }
        router?.showNewScene(delegate: self, sourceView: view.sourceView, sourceRect: view.sourceRect)
    }
    
    func didTapSettings() {
        guard let view = view else {
            return
        }
        router?.showSettings(sourceView: view.sourceView, sourceRect: view.sourceRect)
    }
    
    func didTapImport() {
        view?.showDocumentPicker(with: [], mode: .import, delegate: self)
    }
    
    func didTapRename() {
        guard
            let row = view?.selectedIndexPaths?.first?.row,
            let document = interactor?.documents[safe: row]
        else {
            return
        }
        view?.showEditAlert(
            title: String(format: "Rename \"%@\"?".localized, document.file),
            message: "Enter a new name for this scene:".localized,
            text: nil,
            placeholder: "New scene name".localized
        ) { text in
            do {
                try self.interactor?.renameDocument(at: row, with: text)
            } catch {
                self.view?.showErrorAlert(with: error)
            }
        }
    }
    
    func didTapDuplicate() {
        guard let row = view?.selectedIndexPaths?.first?.row else {
            return
        }
        do {
            try interactor?.duplicateDocument(at: row)
        } catch {
            view?.showErrorAlert(with: error)
        }
    }
    
    func didTapDelete() {
        guard
            let row = view?.selectedIndexPaths?.first?.row,
            let document = interactor?.documents[safe: row]
        else {
            return
        }
        view?.showDeleteAlert(
            title: String(format: "Delete \"%@\"?".localized, document.file),
            message: "Are you sure you want to delete this scene and all of it's images?".localized
        ) { [weak self] in
            guard let self = self else {
                return
            }
            do {
                try self.interactor?.deleteDocument(at: row)
            } catch {
                self.view?.showErrorAlert(with: error)
            }
        }
    }
    
    func didTapExport() {
        guard
            let row = view?.selectedIndexPaths?.first?.row,
            let document = interactor?.documents[safe: row]
        else {
            return
        }
        view?.showDocumentPicker(with: document.url, mode: .exportToService, delegate: self)
    }
    
    func didTapSelect() {
        view?.setAction(.selection)
    }
    
    func didTapDone() {
        view?.setAction(.default)
        view?.setSelectIndexPaths(nil)
    }
    
    func didTapDocument() {
        guard
            view?.action == .default,
            let row = view?.selectedIndexPaths?.first?.row,
            let document = interactor?.documents[safe: row]
        else {
            return
        }
        print(document.name)
        // TODO: -
    }
    
    // MARK: - BrowserOutputInteractorProtocol
    
    func didUpdateDocuments(_ documents: [Document]) {
        let elements = documents.map { BrowserView.Element(id: $0.file, thumbnail: $0.thumbnail, name: $0.name, isLoading: false) }
        view?.setNewSource([ArraySection(model: BrowserView.Section(id: ""), elements: elements)])
    }
    
    // MARK: - NewSceneDelegate
    
    func didTapContinue() {
        do {
            try interactor?.newDocument()
            // TODO: -
        } catch {
            view?.showErrorAlert(with: error)
        }
    }
    
    // MARK: - UIDocumentPickerDelegate
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        // TODO: -
        controller.dismiss(animated: true)
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        // TODO: -
        controller.dismiss(animated: true)
    }
}
