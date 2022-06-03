//
// PalletesOutputViewProtocol.swift
//

import Foundation

protocol PalletesOutputViewProtocol: AnyObject {
    
    // MARK: -
    
    func viewDidLoad()
    
    func didTapEdit()
    
    func didTapNewPallete()
    
    func didTapDone()
    
    func didTapDelete()
    
    func didTapRename()
    
    func didTapPallete()
}
