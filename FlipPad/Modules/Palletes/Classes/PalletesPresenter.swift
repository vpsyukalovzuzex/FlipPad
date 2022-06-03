//
// PalletesPresenter.swift
//

import Foundation
import Core

class PalletesPresenter: PalletesPresenterProtocol,
                         PalletesOutputViewProtocol,
                         PalletesOutputInteractorProtocol {
    
    // MARK: - PalletesPresenterProtocol
    
    weak var view: PalletesInputViewProtocol?
    
    var interactor: PalletesInputInteractorProtocol?
    
    var router: PalletesInputRouterProtocol?
    
    // MARK: - PalletesOutputViewProtocol
    
    func viewDidLoad() {
        view?.setAction(.default)
        interactor?.start()
    }
    
    func didTapEdit() {
        view?.setAction(.editing)
    }
    
    func didTapNewPallete() {
        do {
            try interactor?.newPallete()
        } catch {
            view?.showErrorAlert(with: error)
        }
    }
    
    func didTapDone() {
        view?.setAction(.default)
    }
    
    func didTapDelete() {
        guard
            let row = view?.selectedIndexPaths?.first?.row,
            let pallete = interactor?.palletes[safe: row]
        else {
            return
        }
        view?.showDeleteAlert(
            title: String(format: "Delete \"%@\"?".localized, pallete.name),
            message: "Are you sure you want to delete this pallete?".localized
        ) { [weak self] in
            guard let self = self else {
                return
            }
            do {
                try self.interactor?.deletePallete(at: row)
            } catch {
                self.view?.showErrorAlert(with: error)
            }
        }
    }
    
    func didTapRename() {
        guard
            let row = view?.selectedIndexPaths?.first?.row,
            let pallete = interactor?.palletes[safe: row]
        else {
            return
        }
        view?.showEditAlert(
            title: String(format: "Rename \"%@\"?".localized, pallete.name),
            message: "Enter a new name for this pallete:".localized,
            text: nil,
            placeholder: "New pallete name".localized
        ) { text in
            do {
                try self.interactor?.renamePallete(at: row, with: text)
            } catch {
                self.view?.showErrorAlert(with: error)
            }
        }
    }
    
    func didTapPallete() {
        guard
            view?.action == .default,
            let row = view?.selectedIndexPaths?.first?.row,
            let pallete = interactor?.palletes[safe: row]
        else {
            return
        }
        view?.setSelectIndexPaths(nil)
        router?.showColorSelection(palleteName: pallete.name)
    }
    
    // MARK: - PalletesOutputInteractorProtocol
    
    var defaultPalleteName: String?
    
    // MARK: -
    
    func didSelectPallete(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        view?.setSelectIndexPaths([indexPath])
    }
    
    func didUpdatePalletes(_ palletes: [Pallete]) {
        let newSource = palletes.map { PalletesView.Element(palleteName: $0.name) }
        view?.setNewSource(newSource)
    }
}
