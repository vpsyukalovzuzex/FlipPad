//
// ColorsPresenter.swift
//

import Foundation
import Core

class ColorsPresenter: ColorsOutputViewProtocol,
                       ColorsOutputInteractorProtocol {
    
    // MARK: -
    
    weak var delegate: ColorsDelegate?
    
    // MARK: - ColorsPresenterProtocol
    
    weak var view: ColorsInputViewProtocol?
    
    var interactor: ColorsInputInteractorProtocol?
    
    var router: ColorsInputRouterProtocol?
    
    // MARK: - ColorsOutputViewProtocol
    
    func viewDidLoad() {
        interactor?.start()
    }
    
    func didSelectColor() {
        guard
            let row = view?.selectedIndexPaths?.first?.row,
            let color = interactor?.colors[safe: row]
        else {
            return
        }
        delegate?.didSelectColor(color)
    }
    
    // MARK: - ColorsOutputInteractorProtocol
    
    var palleteName: String?
    
    // MARK: -
    
    func didUpdateColors(_ colors: [Color]) {
        let newSource = colors.map { ColorsView.Element(r: $0.r, g: $0.g, b: $0.b) }
        view?.setNewSource(newSource)
    }
}
