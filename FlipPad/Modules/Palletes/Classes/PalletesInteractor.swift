//
// PalletesInteractor.swift
//

import Foundation
import Core

class PalletesInteractor: PalletesInputInteractorProtocol,
                          PalletesManagerDelegate {
    
    // MARK: - PalletesInteractorProtocol
    
    weak var presenter: PalletesOutputInteractorProtocol?
    
    // MARK: - PalletesInputInteractorProtocol
    
    var palletes = [Pallete]()
    
    // MARK: -
    
    func start() {
        PalletesManager.addObserver(self)
        PalletesManager.setNeedsUpdate()
    }
    
    func newPallete() throws {
        guard let url = Bundle.main.url(forResource: "Empty", withExtension: "dgcplt") else {
            return
        }
        let pallete = try Pallete(url: url)
        guard let data = pallete.data else {
            return
        }
        try FilesManager.createNewFile(with: data, name: pallete.name, pathExtension: .dgcplt)
        PalletesManager.setNeedsUpdate()
    }
    
    func deletePallete(at index: Int) throws {
        guard let pallete = palletes[safe: index] else {
            return
        }
        try FilesManager.deleteFiles(at: [pallete.url])
        PalletesManager.setNeedsUpdate()
    }
    
    func renamePallete(at index: Int, with name: String) throws {
        guard let pallete = palletes[safe: index] else {
            return
        }
        try FilesManager.renameFile(at: pallete.url, with: name)
        PalletesManager.setNeedsUpdate()
    }
    
    // MARK: -
    
    func didSetNeedsUpdatePalletes() {
        palletes = FilesManager.palletesUrls.compactMap { try? Pallete(url: $0) }
        presenter?.didUpdatePalletes(palletes)
        guard
            let defaultPalleteName = presenter?.defaultPalleteName,
            let index = palletes.firstIndex(where: { $0.name == defaultPalleteName })
        else {
            return
        }
        presenter?.didSelectPallete(at: index)
    }
}
